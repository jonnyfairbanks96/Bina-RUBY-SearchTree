require 'binary_ruby_tree/node'
require 'binary_ruby_tree/tree'

module BinaryRubyTree
  module_function

  def new_tree(array)
    Tree.new(array)
  end
end
