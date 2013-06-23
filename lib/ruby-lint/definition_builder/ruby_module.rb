module RubyLint
  module DefinitionBuilder
    class RubyModule < Base
      ##
      # Creates a new module definition.
      #
      # @see #new_node
      #
      def build
        return new_node([definitions])
      end

      ##
      # Determines the scope to define the module in.
      #
      # @return [RubyLint::Definition::RubyObject]
      #
      def scope
        scope       = definitions
        name_prefix = node.children[0].children[0]

        # name_prefix contains the constant path leading up to the name. For
        # example, if the name is `A::B::C` this node would contain `A::B`.
        if name_prefix
          found = resolve_constant_name(name_prefix)
          scope = found if found
        end

        return scope
      end

      protected

      ##
      # Returns the name of the module.
      #
      # @see #constant_name
      #
      def module_name
        return constant_name(node.children[0])
      end

      ##
      # Creates a new RubyObject definition with the specified parent
      # definitions.
      #
      # @param [Array] parents
      # @return [RubyLint::Definition::RubyObject]
      #
      def new_node(parents)
        definition = Definition::RubyObject.new(
          :name             => module_name,
          :parents          => parents,
          :reference_amount => 1,
          :type             => :const
        )

        definition.add(:keyword, 'self', definition)

        return definition
      end
    end # RubyModule
  end # DefinitionBuilder
end # RubyLint