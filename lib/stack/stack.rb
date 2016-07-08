# Implementation of a statically-sized stack
class Stack
  attr_reader :size, :top

  def initialize(size)
    @size = size
    @store = Array.new(size)
    @top = -1
  end

  def look
    @store[@top]
  end

  def push(x)
    return nil if full? || x.nil?
    @top += 1
    @store[@top] = x
  end

  def pop
    return nil if empty?
    popped = @store[@top]
    @store[@top] = nil
    @top -= 1
    popped
  end

  private

  def full?
    @top == (@size - 1)
  end

  def empty?
    @top == -1
  end
end
