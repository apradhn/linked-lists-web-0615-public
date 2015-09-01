require "pry"

class Element
  attr_accessor :datum, :next

  def initialize(datum, tail)
    @datum = datum
    @next = tail
  end

  def to_a
    Element.to_a(self)
  end

  def self.to_a(list)
    if list.nil?
      []
    else
      array = []
      array << list.datum
      head = list.next
      while head
        array << head.datum
        head = head.next
      end
      array
    end
  end

  def self.from_a(array)
    array = array.to_a if array.class == Range
    if array.empty?
      nil
    elsif array.size == 1
      Element.new(array[0], nil)
    else
      Element.new(array[0], Element.from_a(array[1..-1]))
    end
  end

  def reverse
    reversed_array = self.to_a.reverse
    Element.from_a(reversed_array)
  end
end
