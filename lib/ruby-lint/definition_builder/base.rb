module RubyLint
  module DefinitionBuilder
    ##
    # @!attribute [r] node
    #  @return [RubyLint::AST::Node]
    # @!attribute [r] definitions
    #  @return [RubyLint::Definition::RubyObject]
    #
    class Base
      include Helper::ConstantPaths

      attr_reader :definitions, :node, :options

      ##
      # @param [RubyLint::AST::Node] node
      # @param [RubyLint::Definition::RubyObject] definitions
      # @param [Hash] options
      #
      def initialize(node, definitions, options = {})
        @node        = node
        @definitions = definitions
        @options     = options

        after_initialize if respond_to?(:after_initialize)
      end

      protected

      ##
      # Tries to resolve the definition for the node's name.
      #
      # @param [RubyLint::AST::Node] node
      # @return [RubyLint::Definition::RubyObject]
      #
      def resolve_constant_name(node)
        if node.children[0]
          found = resolve_constant_path(node)
        else
          found = definitions.lookup(node.type, constant_name(node))
        end

        return found
      end

      ##
      # Returns the name of a constant node as a String.
      #
      # @param [RubyLint::AST::Node] node
      # @return [String]
      #
      def constant_name(node)
        return node.children[1].to_s
      end
    end # Base
  end # DefinitionBuilder
end # RubyLint