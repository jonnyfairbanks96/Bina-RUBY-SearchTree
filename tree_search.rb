require 'pry'

class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value = nil)
    @value = value
  end

  def leaf?
    right.nil? && left.nil?
  end

  def inner?
    !right.nil? || !left.nil?
  end

  # traverse the tree left to right
  def each(&block)
    left.each(&block) if left
    block.call(self)
    right.each(&block) if right
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

  private

  def new_list(list)
    list.shuffle.each do |item|
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
end
