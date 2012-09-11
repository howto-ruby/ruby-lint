module Rlint
  ##
  # {Rlint::Iterator} is a class that iterates over the AST nodes of
  # {Rlint::Parser} and executes any bound callbacks for the various node types
  # it finds.
  #
  class Iterator
    attr_reader :callbacks

    def initialize(ast, file = '(rlint)')
      @ast       = ast
      @file      = file
      @callbacks = []
    end

    def iterate(nodes = @ast)
      nodes.each do |node|
        next if node.nil?

        callback_name = 'on_' + node.event.to_s

        @callbacks.each do |obj|
          if obj.respond_to?(callback_name)
            obj.send(callback_name, node)
          end
        end

        # Iterate over all the child nodes.
        if node.value and node.value.respond_to?(:each)
          iterate(node.value)
        end
      end
    end

    def bind(callback_class)
      @callbacks << callback_class.new(@file)
    end
  end # Iterator
end # Rlint
