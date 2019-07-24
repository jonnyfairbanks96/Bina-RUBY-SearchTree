class BinarySearch
  attr_reader :list

  def initialize(list)
    unless list.uniq.sort == list
      raise ArgumentError, 'Cannot perform a search against a unsorted, non-unique list'
    end

    @list = list
  end

  def search_for(value, head=0, tail=list.length)
    raise RuntimeError, "Value: #{value} was not found in the list" if head > tail

    middle_index = middle(head, tail)
    case compare(value, list[middle_index])
    when :left
      search_for(value, head, middle_index - 1)
    when :right
      search_for(value, middle_index + 1, tail)
    when :match
      middle_index
    end
  end

  def middle(head=0, tail=list.length)
    ((tail - head) / 2).floor + head
  end

  private

  def compare(value, other)
    if value > other
      :right
    elsif value < other
      :left
    else
      :match
    end
  end
end
