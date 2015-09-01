require_relative '../simple-lists/simple_linked_list'

class Deque
  attr_accessor :list

  def initialize
    @list = nil
  end

  def push(number)
    if @list.nil?
      @list = Element.new(number, nil)
    else
      if @list.next
        next_element = @list.next
        while next_element.next
          next_element = next_element.next
        end
        next_element.next = Element.new(number, nil)
      else
        @list.next = Element.new(number, nil)
      end
    end
  end

  def pop
    element = @list
    if @list.next.nil?
      last_value = @list.datum
      @list = nil
      last_value
    else
      last_value = @list.next.datum
      @list = Element.new(@list.datum, nil)
      last_value
    end
  end

  def shift
    first_value = @list.datum
    @list.next ? @list = Element.new(@list.next.datum, @list.next.next) : @list = nil
    first_value
  end

  def unshift(number)
    @list = Element.new(number, @list)
  end
end
