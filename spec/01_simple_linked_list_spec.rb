describe 'Simple Singly-Linked Lists' do
  let(:one) { Element.new(1, nil) }
  let(:two) { Element.new(2, one) }
  let(:three) { Element.new(3, two) }

  it 'initializes elements correctly' do
    expect(one.datum).to eq(1)
    expect(one.next).to be_nil

    expect(two.datum).to eq(2)
    expect(two.next).to eq(one)

    expect(three.datum).to eq(3)
    expect(three.next).to eq(two)
  end

  it 'converts to an array' do
    expect(Element.to_a(nil)).to eq([])
    expect(Element.to_a(one)).to eq([1])
    expect(Element.to_a(two)).to eq([2,1])
    expect(Element.to_a(three)).to eq([3,2,1])
  end

  it 'converts from an array' do
    expect(Element.from_a([])).to be_nil

    one_a = Element.from_a([1])
    expect(one_a.datum).to eq(1)
    expect(one_a.next).to be_nil

    two_a = Element.from_a([2, 1])
    expect(two_a.datum).to eq(2)
    expect(two_a.next.datum).to eq(1)
    expect(two_a.next.next).to be_nil

    one_to_ten = Element.from_a(1..10)
    expect(one_to_ten.next.next.next.next.next.next.next.next.next.datum).to eq(10)
  end

  it 'does a complete roundtrip' do
    expect(Element.from_a([1]).to_a).to eq([1])
    expect(Element.from_a([2, 1]).to_a).to eq([2, 1])
    expect(Element.from_a(1..10).to_a).to eq((1..10).to_a)
  end

  it 'reverses the elements' do
    # one_r and @one need not be the same object
    one_r = one.reverse
    expect(one_r.datum).to eq(1)
    expect(one_r.next).to be_nil

    two_r = two.reverse
    expect(two_r.datum).to eq(1)
    expect(two_r.next.datum).to eq(2)

    three_r = three.reverse
    expect(three_r.datum).to eq(1)
    expect(three_r.next.datum).to eq(2)
    expect(three_r.next.next.datum).to eq(3)

    # ensure that nothing changed about the given objects
    expect(one.datum).to eq(1)
    expect(one.next).to be_nil

    expect(two.datum).to eq(2)
    expect(two.next).to eq(one)

    expect(three.datum).to eq(3)
    expect(three.next).to eq(two)
  end
end
