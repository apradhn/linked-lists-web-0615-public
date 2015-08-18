require_relative '../simple-lists/simple_linked_list'

class Deque
  attr_accessor :list

  def initialize
    @list = nil
  end

  def push(datum)
    if list.nil?
      self.list = Element.new(datum, nil)
    elsif list.datum && list.next.nil?
      list.next = Element.new(datum, nil)
    elsif list.datum && list.next
      list.next.next = Element.new(datum, nil)
    end
  end

  def pop
    if list.next.nil?
      popped_value = list.datum
    else
      popped_value = list.next.datum
    end
    self.list = Element.new(list.datum, nil)
    popped_value    
  end

  def shift
    shifted_value = list.datum
    if list.next.nil?
      self.list = nil
    elsif list.next.next.nil?
      self.list = Element.new(self.list.next.datum, nil)
    else
      self.list = Element.new(self.list.next.datum, self.list.next.next)
    end
    shifted_value
  end

  def unshift(datum)
    if list.nil?
      self.list = Element.new(datum, nil)
    else 
      self.list = Element.new(datum, Element.new(list.datum, list.next))
    end
  end
end
