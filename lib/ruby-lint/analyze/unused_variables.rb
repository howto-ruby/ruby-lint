module RubyLint
  module Analyze
    ##
    # The UnusedVariables class checks for variables that are defined but never
    # used. Whenever it finds one of these variables it will add a
    # corresponding warning message.
    #
    class UnusedVariables < Iterator
      include Helper::CurrentScope
      include Helper::ConstantPaths

      ##
      # Hash containing the various variable types for which to add warnings
      # and human readable names for these types.
      #
      # @return [Hash]
      #
      VARIABLE_TYPES = {
        :local_variable    => 'local variable',
        :global_variable   => 'global variable',
        :instance_variable => 'instance variable',
        :class_variable    => 'class variable',
        :constant          => 'constant'
      }

      VARIABLE_TYPES.each do |type, label|
        define_method("on_#{type}") do |node|
          variable = current_scope.lookup(node.type, node.name)

          if variable and !variable.used?
            warning("unused #{label} #{node.name}", node)
          end
        end
      end

      ##
      # @param [RubyLint::Node] node
      #
      def on_constant_path(node)
        iterate_constant_path(node) do |name, segment, definition|
          if definition and !definition.used?
            warning("unused constant #{name}", segment)
          end
        end
      end
    end # UnusedVariables
  end # Analyze
end # RubyLint
