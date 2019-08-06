module BinaryRubyTree
  class Tree
    attr_reader :root_node

    def initialize(*list)
      unless list.sort.uniq == list
        raise ArgumentError, 'Cannot build a tree with an un-sorted, non-unique list'
      end

      if list != []
        new_tree(list)
      end
    end

    def add(node)
      build(node, root_node)
    end

    def search(value, node = root_node, level = 0)
      return nil unless node

      if value == node.value
        puts " Level: #{level} ".center(30, '=')
        node
      elsif value > node.value
        search(value, node.right, level += 1)
      elsif value < node.value
        search(value, node.left, level += 1)
      else
        puts 'Value does not exsist'
        nil
      end
    end

    private

    def new_tree(list)
      middle_item = middle(0, list.length)
      @root_node ||= BinaryRubyTree::Node.new(middle_item)

      list.shuffle.each do |item|
        next if item == root_node.value
        build(item, root_node)
      end
    end

    def middle(head=0, tail=list.length)
      ((tail - head) / 2).floor + head
    end

    def build(node, other)
      if root_node.nil?
        @root_node = BinaryRubyTree::Node.new(node)
      elsif node > other.value
        return build(node, other.right) if other.right

        other.right = BinaryRubyTree::Node.new(node)
      elsif node < other.value
        return build(node, other.left) if other.left

        other.left = BinaryRubyTree::Node.new(node)
      else
        raise RuntimeError, 'Duplicate values cannot be added'
      end
    end
  end
end
