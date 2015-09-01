require_relative '../simple-lists/simple_linked_list'

class Deque
  attr_accessor :list

  def initialize
    @list = nil
  end

  def push(number)
    array = Element.to_a(@list)
    array << number
    @list = Element.from_a(array)
  end

  def pop
    array = Element.to_a(@list)
    last_value = array[-1]
    @list = Element.from_a(array[0...-1])
    last_value
  end

  def shift
    first_value = @list.datum
    @list = Element.from_a(Element.to_a(@list)[1..-1])
    first_value
  end

  def unshift(number)
    @list = Element.new(number, @list)
  end
end
