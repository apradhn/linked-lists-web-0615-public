require "pry"

class Element
  attr_accessor :datum
  attr_reader :next, :previous

  def previous=(element)
    @previous = element
    element.instance_variable_set(:@next, self)
  end

  def next=(element)
    @next = element
    element.instance_variable_set(:@previous, self)
  end

  def initialize(datum, next_elem)
    @datum = datum
    @next = next_elem
    next_elem.instance_variable_set(:@previous, self) if next_elem.class == Element
  end

  def self.to_a(element)
    if element.nil?
      []
    else
      Element.to_a(element.next).unshift(element.datum)
    end
  end

  def to_a
    Element.to_a(self)
  end

  def self.from_a(arr)
    arr = arr.to_a if arr.class == Range

    if arr.empty?
      nil
    elsif arr.size == 1
      Element.new(arr[0], nil)
    else
      Element.new(arr[0], Element.from_a(arr[1..-1]))
    end
  end


  def reverse
    arr = Element.to_a(self)
    Element.from_a(arr.reverse)
  end


end
