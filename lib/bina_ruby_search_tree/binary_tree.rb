module BinaRubySearchTree
  class BinaryTree
    attr_reader :list, :root_node

    def initialize(list)
      unless list.sort.uniq == list
        raise ArgumentError, 'Cannot build a tree with an un-sorted, non-unique list'
      end

      @list = new_list(list)
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
        nil
      end
    end

    def delete(value)
      node = search(value)
      if node
        remove(node)
      end
    end

    def tree_is_valid?(node, min=-1.0/0.0, max=1.0/0.0)
      until node.left.nil? && node.right.nil?
        if min > node.value || max < node.value
          return false
        else
          tree_is_valid?(node.left, min, node.value)
          tree_is_valid?(node.right, node.value, max)
        end
        return true
      end
    end

    private

    def remove(node)
      if node.leaf?
        node = nil
      elsif node.left && node.right.nil?
        node = node.left
      elsif node.left.nil? && node.right
        node = node.right
      else
        node = delete_node_with_two_children(node)
      end
      node
    end

    def delete_node_with_two_children(node)

    end

    def new_list(list)
      middle_item = middle(0, list.length)
      @root_node ||= Node.new(middle_item)

      list.each do |item|
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

        other.right = Node.new(node)
      elsif node < other.value
        return build(node, other.left) if other.left

        other.left = Node.new(node)
      else
        raise RuntimeError, 'Duplicate values cannot be added'
      end
    end
  end
end
