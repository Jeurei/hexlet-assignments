# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

# Test for Stack class
class StackTest < Minitest::Test
  # BEGIN
  def test_pushes_elements_to_the_stack
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    assert { stack.to_a == [1, 2, 3] }
  end

  def test_pops_elements_from_the_stack
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    assert { stack.pop! == 3 }
    assert { stack.to_a == [1, 2] }
  end

  def test_should_clear_the_stack
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.clear!
    assert { stack.to_a == [] }
  end

  def test_should_check_empty
    stack = Stack.new
    assert { stack.empty? }
    stack.push!(1)
    assert { !stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
