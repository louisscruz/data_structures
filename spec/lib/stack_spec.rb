require "stack/stack"

RSpec.describe Stack do
  def init_stack
    Stack.new(3)
  end

  before(:each) do
    @stack = init_stack
    @stack.push(3)
  end

  it "should have one element" do
    expect(@stack.look).to eq(3)
  end

  context "when accessing" do
    it "should properly return the top" do
      expect(@stack.look).to eq(3)
    end

    it "should return nil as top when empty" do
      @stack.pop
      expect(@stack.look).to eq(nil)
    end
  end

  context "when searching" do
    it "should properly return the index when value present" do
      expect(@stack.search(3)).to eq(0)
    end

    it "should properly return the index of the first value present" do
      @stack.push(3)
      expect(@stack.search(3)).to eq(0)
    end
  end

  context "when inserting" do
    it "should properly return the new value" do
      expect(@stack.push(2)).to eq(2)
    end

    it "should return nil if overflow" do
      2.times do
        @stack.push(1)
      end
      expect(@stack.push(1)).to eq(nil)
    end
  end

  context "when deleting" do
    it "should properly return the new value" do
      expect(@stack.pop).to eq(3)
      expect(@stack.look).to eq(nil)
    end

    it "should return nil when underflow" do
      @stack.pop
      expect(@stack.pop).to eq(nil)
      expect(@stack.look).to eq(nil)
    end
  end

  context "when finding min" do
    it "should properly return the lowest" do
      @stack.push(2)
      expect(@stack.min).to eq(2)
    end

    it "should return nil when no lowest" do
      @stack.pop
      expect(@stack.min).to eq(nil)
    end
  end

  context "when finding max" do
    it "should properly return the highest" do
      @stack.push(10)
      expect(@stack.max).to eq(10)
    end

    it "should return nil when no highest" do
      @stack.pop
      expect(@stack.max).to eq(nil)
    end
  end
end
