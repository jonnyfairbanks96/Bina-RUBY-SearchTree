require 'pry'
class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value = nil)
    @value = value
  end

  def leaf?
    right.nil? || left.nil?
  end

  def inner?
    right || left
  end
end

class BinaryTree
  attr_reader :list, :root_node

  def initialize(list)
    unless list.uniq == list
      raise ArgumentError, 'Cannot build a tree with a non-unique list'
    end

    @list = new_list(list)
  end

  def show_list
    list.each do |node|

    end
  end

  private

  def new_list(list)
    list.shuffle.map do |item|
      if root_node == nil
        @root_node = Node.new(item)
        next
      end
      build(item, root_node)
    end
  end

  def build(node, other)
    if node > other.value
      return build(node, other.right) if other.right

      other.right = Node.new(node)
    elsif node < other.value
      return build(node, other.left) if other.left

      other.left = Node.new(node)
    end
  end

  def compare(node)
    if node.left.nil?
      :left
    elsif node.right.nil?
      :right
    else
      :node_full
    end
  end
end
