module RubyLint
  ##
  # The ConstantLoader class tries to pre-load various constants in a given
  # file before the definitions are being built and analysis is performed.
  #
  # Note that this pre-loader is rather basic and as such there are chances you
  # still have to manually require definitions to ensure that they are being
  # used.
  #
  # @!attribute [r] loaded
  #  @return [Hash] Hash containing the loaded constants.
  #
  class ConstantLoader < Iterator
    attr_reader :loaded

    ##
    # List of directories to search for definition files.
    #
    # @return [Array]
    #
    LOAD_PATH = [
      File.expand_path('../definitions/core', __FILE__)
    ]

    ##
    # @see RubyLint::Iterator#initialize
    #
    def initialize(*args)
      super

      @loaded           = {}
      @in_constant_path = false
    end

    ##
    # @param [RubyLint::Node] node
    #
    def on_constant_path(node)
      @in_constant_path = true

      load(node.children.first.name)
    end

    ##
    # @param [RubyLint::Node] node
    #
    def after_constant_path(node)
      @in_constant_path = false
    end

    ##
    # @param [RubyLint::Node] node
    #
    def on_constant(node)
      return if @in_constant_path

      load(node.name)
    end

    ##
    # Checks if the given constant is already loaded or not.
    #
    # @param [String] constant
    # @return [TrueClass|FalseClass]
    #
    def loaded?(constant)
      return loaded.key?(constant)
    end

    ##
    # Tries to load the definitions for the given constant.
    #
    # @param [String] constant
    #
    def load(constant)
      return if loaded?(constant)

      filename = constant.snake_case + '.rb'

      LOAD_PATH.each do |path|
        path = File.join(path, filename)

        if File.file?(path)
          require(path)
          loaded[constant] = true

          break
        end
      end
    end
  end # ConstantLoader
end # RubyLint
