require 'bina_ruby_search_tree/node'
require 'bina_ruby_search_tree/binary_tree'

module BinaRubySearchTree
  module_function

  def new_tree(arr)
    BinaryTree.new(arr)
  end
end
