module BinaRubySearchTree
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
end
