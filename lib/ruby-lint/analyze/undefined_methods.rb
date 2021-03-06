module RubyLint
  module Analyze
    ##
    # The UndefinedMethods class checks for the use of undefined methods/local
    # variables and adds errors whenever needed. Based on the receiver of a
    # method call the corresponding error message differs to make it easier to
    # understand what is going on.
    #
    # A simple example:
    #
    #     foobar        # => undefined method foobar
    #     'test'.foobar # => undefined method foobar on an instance of String
    #
    class UndefinedMethods < Iterator
      include Helper::Methods

      ##
      # @param [RubyLint::Node] node
      #
      def on_method(node)
        # Don't add errors for non existing receivers as these are handled by
        # classes such as UndefinedVariables.
        return if invalid_receiver?(node)

        valid = method_defined?(node)
        error = "undefined method #{node.name}"

        # Methods called on block variables should be ignored since these
        # variables don't carry any class information with them.
        if !valid and node.receiver
          receiver = method_receiver(node.receiver)
          valid    = receiver && receiver.ignore

          if receiver.variable? and receiver.value
            receiver = receiver.value
          end

          if receiver
            error = receiver_error(node.name, receiver)
          end
        end

        error(error, node) unless valid
      end

      private

      ##
      # Creates an error message for a method call on a receiver.
      #
      # @param [String] name
      # @param [RubyLint::Definition::RubyObject] receiver
      # @return [String]
      #
      def receiver_error(name, receiver)
        error         = "undefined method #{name} on #{receiver.name}"
        receiver_name = receiver.ruby_class || receiver.name

        if receiver.instance?
          error = "undefined method #{name} on an instance " \
            "of #{receiver_name}"
        end

        return error
      end
    end # UndefinedMethods
  end # Analyze
end # RubyLint
