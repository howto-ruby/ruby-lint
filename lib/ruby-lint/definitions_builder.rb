module RubyLint
  ##
  # {RubyLint::DefinitionsBuilder} is a iterator class responsible for building
  # a list of definitions. This approach means that individual iterator classes
  # don't have to bother with this process and can instead focus on analyzing
  # code.
  #
  class DefinitionsBuilder < Iterator
    ##
    # Array of variable types that should be exported to the outer scope of a
    # method definition.
    #
    # @return [Array]
    #
    EXPORT_VARIABLES = [:instance_variable, :class_variable, :constant]

    ##
    # Hash containing the definition types to copy when including/extending a
    # module.
    #
    # @return [Hash]
    #
    INCLUDE_CALLS = {
      'include' => {
        :constant        => :constant,
        :instance_method => :instance_method
      },
      'extend' => {
        :constant        => :constant,
        :instance_method => :method
      }
    }

    # Define the methods used for incrementing the amount of references to a
    # variable.
    [
      :local_variable,
      :global_variable,
      :instance_variable,
      :class_variable,
      :constant,
      :constant_path
    ].each do |type|
      define_method("on_#{type}") do |node|
        if node.constant_path?
          variable = resolve_definitions(node.children)
        else
          variable = definitions.lookup(node.type, node.name)
        end

        increment_reference_amount(variable) if variable

        enable_reference_counting
      end
    end

    ##
    # Called at the root node of a Ruby script.
    #
    # @param [RubyLint::Node] node
    #
    def on_root(node)
      @options[:node_definitions] = {}
      @options[:definitions]      = initial_definitions

      enable_reference_counting
      associate_node_definition(node, definitions)
    end

    ##
    # Creates a new module definition and updates the scope accordingly. If the
    # module already exists the existing set of definitions is used instead of
    # creating a new one.
    #
    # @param [RubyLint::Node] node
    #
    def on_module(node)
      scope   = definitions
      mod_def = Definition::RubyObject.new_from_node(
        node,
        :value   => nil,
        :parents => [scope]
      )

      increment_reference_amount(mod_def)

      if scope.has_definition?(:constant, mod_def.name)
        existing = scope.lookup(:constant, mod_def.name)

        if existing
          @definitions << update_parent_definitions(existing, scope)

          increment_reference_amount(existing)
          associate_node_definition(node, existing)

          return
        end
      end

      define_module(node, mod_def)
    end

    ##
    # Changes the scope back to the outer scope of a module definition.
    #
    # @param [RubyLint::Node] node
    #
    def after_module(node)
      @definitions.pop
    end

    ##
    # Creates a new class definition and updates the scope accordingly.
    #
    # @see RubyLint::DefinitionsBuilder#on_module
    #
    def on_class(node)
      scope  = definitions
      parent = RubyLint.global_constant('Object')

      # Resolve the definition of the parent class.
      if node.children[1]
        if node.children[1].constant_path?
          parent = resolve_definitions(node.children[1].children)
        else
          parent = resolve_definitions([node.children[1]])
        end
      end

      class_def = Definition::RubyObject.new_from_node(
        node,
        :value   => nil,
        :parents => [parent, scope]
      )

      increment_reference_amount(class_def)

      # Use an existing definition list if it exists.
      if scope.has_definition?(:constant, class_def.name)
        existing = scope.lookup(:constant, class_def.name)

        if existing
          @definitions << update_parent_definitions(existing, scope)

          increment_reference_amount(existing)
          associate_node_definition(node, existing)

          return
        end
      end

      define_module(node, class_def)
    end

    ##
    # Changes the scope back to the outer scope of the class definition.
    #
    # @param [RubyLint::Node] node
    #
    def after_class(node)
      @definitions.pop
    end

    ##
    # Called when an sclass block is found. These blocks look like the
    # following:
    #
    #     class << self
    #       # ...
    #     end
    #
    # @param [RubyLint::Node] node
    #
    def on_sclass(node)
      use   = node.children[0]
      found = definitions.lookup(use.type, use.name) || definitions

      associate_node_definition(node, found)

      @definitions << found
      @call_types  << :method
    end

    ##
    # Called after an sclass block has been processed.
    #
    # @param [RubyLint::Node] node
    #
    def after_sclass(node)
      @definitions.pop
      @call_types.pop
    end

    ##
    # Creates a new method definition. This definition is either added in the
    # current scope or in the scope of the receiver in case one is specified.
    # Any method arguments are automatically added as definitions to the inner
    # scope.
    #
    # @param [RubyLint::Node] node
    #
    def on_method_definition(node)
      scope  = definitions
      method = Definition::RubyMethod.new_from_node(
        node,
        :parents       => [scope],
        :method_type   => call_type,
        :instance_type => :instance
      )

      if method.receiver
        existing = scope.lookup(method.receiver.type, method.receiver.name)

        if existing
          scope = method.receiver = existing
        else
          return
        end
      end

      scope.add(method.method_type, method.name, method)

      associate_node_definition(node, method)

      @definitions << method
    end

    ##
    # Resets the scope to the outer scope and exports various variables into
    # this scope.
    #
    # @param [RubyLint::Node] node
    #
    def after_method_definition(node)
      method = @definitions.pop

      # TODO: variables should only be exported when the method is actually
      # called.
      EXPORT_VARIABLES.each do |type|
        method.definitions[type].each do |name, defs|
          definitions.add(type, name, defs)
        end
      end
    end

    ##
    # Creates definitions for variable assignments. When assigning a value to a
    # constant path and a particular segment does not exist the entire
    # assignment is skipped.
    #
    # @param [RubyLint::Node|Array] node
    #
    def on_assign(node)
      variable, value = *node
      assign_method   = "on_#{variable.type}_assign"

      # Deal with multiple variable assignments such as the following:
      # first = second = third = 10
      value = resolve_assignment_value(value)

      if respond_to?(assign_method)
        send(assign_method, variable, value)
      else
        assign_variable(definitions_for(variable), variable, value)
      end

      # Don't count references for the variable that's being assigned.
      disable_reference_counting
    end

    ##
    # @see RubyLint::DefinitionsBuilder#on_assign
    #
    def after_assign(node)
      enable_reference_counting
    end

    ##
    # Processes conditional variable assignments.
    #
    # @see RubyLint::DefinitionsBuilder#on_assign
    #
    def on_op_assign(node)
      type = node.children[0].type
      name = node.children[0].children[0]

      on_assign(node.children) unless definitions.lookup(type, name)
    end

    ##
    # Handles the assignments of constant paths.
    #
    # @param [RubyLint::Node] variable
    # @param [RubyLint::Node] value
    #
    def on_constant_path_assign(variable, value)
      scope = resolve_definitions(variable.children[0..-2])
      last  = variable.children[-1]

      assign_variable(scope, last, value, last.type) if scope
    end

    ##
    # Handles the assignments of Array indexes, Hash keys and object members.
    #
    # @param [RubyLint::Node] variable
    # @param [RubyLint::Node] values
    #
    def on_aref_assign(variable, values)
      target  = variable.children[0]
      members = variable.gather_arguments(:argument)
      scope   = definitions.lookup(target.type, target.name)

      return unless scope

      members.each_with_index do |member, index|
        member = resolve_variable(member) if member.variable?

        next unless member

        assign_variable(scope, member, values[index], :member)
      end
    end

    ##
    # Called when a value is assigned to an object member.
    #
    # @param [RubyLint::Node] variable
    # @param [RubyLint::Node] value
    #
    def on_field_assign(variable, value)
      object, member = *variable
      object_def     = definitions.lookup(object.type, object.name)

      if object_def
        assign_variable(object_def, member, value, :member)
      end
    end

    ##
    # Processes the local variables created by `for` loops.
    #
    # @param [RubyLint::Node] node
    #
    def on_for(node)
      scope = definitions

      # The values are set to `nil` as the only reliable way of retrieving
      # these is actual code evaluation.
      node.children[0].each do |variable|
        assign_variable(scope, variable, nil)
      end
    end

    ##
    # Creates a new scope for the block's body.
    #
    # @param [RubyLint::Node] node
    #
    def on_block(node)
      scope = definitions
      block = Definition::RubyObject.new_from_node(
        node,
        :name           => 'block',
        :parents        => [scope],
        :update_parents => [:local_variable]
      )

      node.each_argument do |arg|
        variable = Definition::RubyObject.new_from_node(arg, :ignore => true)

        block.add(arg.type, arg.name, variable)
      end

      # Ensure that local variables in the current scope are available inside
      # the block.
      scope.list(:local_variable).each do |variable|
        block.add(variable.type, variable.name, variable)
      end

      associate_node_definition(node, block)

      @definitions << block
    end

    ##
    # @param [RubyLint::Node] node
    #
    def after_block(node)
      @definitions.pop
    end

    ##
    # Includes/extends a module when the `include` or `extend` method is
    # called.
    #
    # @param [RubyLint::Node] node
    #
    def on_method(node)
      return unless INCLUDE_CALLS.key?(node.children[0])

      method_call = Definition::RubyMethod.new_from_node(node)
      copy_types  = INCLUDE_CALLS[method_call.name]
      scope       = definitions

      method_call.arguments.each do |param|
        if param.receiver
          source = resolve_definitions(param.receiver_path)
        else
          source = scope.lookup(param.type, param.name)
        end

        if source.variable?
          source = source.value
        end

        next unless source.is_a?(Definition::RubyObject)

        copy_types.each do |from, to|
          source.definitions[from].each do |name, definition|
            scope.add(to, name, definition)
          end
        end
      end
    end

    private

    ##
    # Assigns a value to the specified variable.
    #
    # @param [RubyLint::Definition::RubyObject] definition The definition
    #  list to add the variable to.
    # @param [RubyLint::Node] variable The variable to create.
    # @param [RubyLint::NOde] value The value of the variable.
    # @param [NilClass|Symbol] type The type of variable to add, set to the
    #  type of `variable` by default.
    #
    def assign_variable(definition, variable, value, type = variable.type)
      # Resolve variable values.
      if value and (value.variable? or value.constant?)
        found_value = resolve_variable(value)
        value       = found_value if found_value
      end

      if value and value.method?
        value = resolve_return_value(value)
      end

      var_def = create_variable_definition(variable, value)

      # Certain types (the core Ruby types in particular) should be turned into
      # instances when used for assigning a variable.
      if create_instance?(var_def)
        val_def = RubyLint.global_constant(var_def.value.ruby_class)

        var_def.value.instance!

        var_def.value.parents << val_def.instance if val_def
      end

      if value and value.collection?
        assign_collection_members(var_def, value)
      end

      definition.add(type, var_def.name, var_def)
    end

    ##
    # Assigns the indexes of the array to a definitions list.
    #
    # @param [RubyLint::Definition::RubyObject] definitions
    # @param [Array] values
    #
    def assign_array_indexes(definitions, values)
      values.each_with_index do |value, index|
        assign_variable(
          definitions,
          Node.new(:integer, [index.to_s]),
          value,
          :member
        )
      end
    end

    ##
    # Assigns the key/value pairs of a hash to a definition list.
    #
    # @param [RubyLint::Definition::RubyObject] definitions
    # @param [Array] values
    #
    def assign_hash_pairs(definitions, values)
      values.each do |pair|
        assign_variable(definitions, pair, pair.value, :member)
      end
    end

    ##
    # Determines what method should be used for processing a collection's
    # member values.
    #
    # @param [RubyLint::Definition::RubyObject] variable
    # @param [RubyLint::Node] value
    #
    def assign_collection_members(variable, value)
      if value.array?
        assign_array_indexes(variable, value.value)
      elsif value.hash?
        assign_hash_pairs(variable, value.value)
      end
    end

    ##
    # Adds a definition for the `self` keyword.
    #
    # @param [RubyLint::Definition::RubyObject] definition The definition
    #  list to add the keyword to.
    #
    def add_self(definition)
      definition.add(:keyword, 'self', definition)
    end

    ##
    # Increments the reference amount of the specified definition.
    #
    # @param [RubyLint::Definition::RubyObject] definition
    #
    def increment_reference_amount(definition)
      definition.reference_amount += 1 if @enable_reference_counting
    end

    ##
    # Enables reference counting of variables.
    #
    def enable_reference_counting
      @enable_reference_counting = true
    end

    ##
    # Disables reference counting of variables.
    #
    def disable_reference_counting
      @enable_reference_counting = false
    end

    ##
    # Creates a new {RubyLint::Definition::RubyObject} instance for a variable
    # with an optional value.
    #
    # @param [RubyLint::Definition::RubyObject|RubyLint::Node] variable
    # @param [RubyLint::Definition::RubyObject|RubyLint::Node] value
    # @return [RubyLint::Definition::RubyObject]
    #
    def create_variable_definition(variable, value = nil)
      if variable.is_a?(Node)
        definition = Definition::RubyObject.new_from_node(
          variable,
          :value => value
        )
      else
        definition       = variable
        definition.value = value
      end

      return definition
    end

    ##
    # Returns a boolean that indicates if the definition should be an instance
    # of a Ruby value.
    #
    # @param [RubyLint::Definition::RubyObject] definition
    # @return [TrueClass|FalseClass]
    #
    def create_instance?(definition)
      val = definition.value

      return val && val.ruby_class
    end

    ##
    # Resolves variables that point to other variables down to the original
    # one.
    #
    # @param [RubyLint::Definition::RubyOject] variable
    # @return [RubyLint::Definition::RubyObject|NilClass]
    #
    def resolve_variable(variable)
      resolved = variable

      if variable.variable? or variable.constant?
        resolved = definitions.lookup(variable.type, variable.name)

        if resolved and !resolved.constant?
          resolved = resolved.value
        elsif !resolved
          resolved = nil
        end
      end

      return resolved
    end

    ##
    # Resolves the return value of a method call.
    #
    # @param [RubyLint::Node] node
    # @return [RubyLint::Definition::RubyObject|NilClass]
    #
    def resolve_return_value(node)
      source = definitions

      if node.receiver
        if node.receiver.method?
          source = resolve_return_value(node.receiver)
        else
          source = source.lookup(node.receiver.type, node.receiver.name)
        end
      end

      return source ? source.call(node.name) : nil
    end

    ##
    # Extracts the end value used in multiple variable assignments in the form
    # of `first = second = third = 10`.
    #
    # @param [RubyLint::Node|Array] node
    # @return [RubyLint::Node]
    #
    def resolve_assignment_value(node)
      if node.respond_to?(:type) and node.type == :assign
        node = resolve_assignment_value(node.value)
      end

      return node
    end

    ##
    # @param [RubyLint::Node] node
    # @return [RubyLint::Definition::RubyObject]
    #
    def definitions_for(node)
      return node.global_variable? ? @options[:definitions] : definitions
    end

    ##
    # Updates the parent definitions of a given definition object.
    #
    # @param [RubyLint::Definition::RubyObject] existing
    # @param [RubyLint::Definition::RubyObject] parent
    # @return [RubyLint::Definition::RubyObject]
    #
    def update_parent_definitions(existing, parent)
      existing.parents << parent unless existing.parents.include?(parent)

      return existing
    end

    ##
    # Creates the required definitions for a new class or module.
    #
    # @param [RubyLint::Node] node
    # @param [RubyLint::Definition::RubyObject] constant
    #
    def define_module(node, constant)
      add_self(constant)

      definitions.add(:constant, constant.name, constant)

      associate_node_definition(node, constant)

      @definitions << constant
    end

    ##
    # @return [RubyLint::Definition::RubyObject]
    #
    def initial_definitions
      definitions = Definition::RubyObject.new(
        :name          => 'root',
        :type          => :root,
        :parents       => [RubyLint.global_constant('Kernel')],
        :instance_type => :instance
      )

      definitions.merge(RubyLint.global_scope)

      return definitions
    end
  end # DefinitionsBuilder
end # RubyLint
