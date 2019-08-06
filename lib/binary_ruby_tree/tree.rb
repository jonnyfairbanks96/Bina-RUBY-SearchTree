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

    def search(value, node = root_node)
      return nil unless node

      if value == node.value
        node
      elsif value > node.value
        search(value, node.right)
      elsif value < node.value
        search(value, node.left)
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
      if node > other.value
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
