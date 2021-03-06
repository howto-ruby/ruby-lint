require File.expand_path('../../helper', __FILE__)

describe RubyLint::ConstantLoader do
  after do
    RubyLint.global_scope.definitions[:constant].delete('ERB')
  end

  should 'lazy load using a constant' do
    constant = 'ERB'
    ast      = parse(constant)
    iterator = RubyLint::ConstantLoader.new

    RubyLint.global_scope.lookup(:constant, constant).nil?.should == true

    iterator.iterate(ast)

    RubyLint.global_scope.lookup(:constant, constant).nil?.should == false
  end

  should 'lazy load using a constant path' do
    constant = 'Enumerable'
    ast      = parse('Enumerable::Enumerator')
    iterator = RubyLint::ConstantLoader.new

    RubyLint.global_scope.lookup(:constant, constant).nil?.should == true

    iterator.iterate(ast)

    RubyLint.global_scope.lookup(:constant, constant).nil?.should     == false
    RubyLint.global_scope.lookup(:constant, 'Enumerator').nil?.should == true
  end
end
