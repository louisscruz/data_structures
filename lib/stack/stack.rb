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

  def search(x)
    return nil if empty?
    (0..@top).find { |i| @store[i] == x }
  end

  def min
    return nil if empty?
    min = nil
    (0..@top).each do |i|
      current = @store[i]
      min = current if min == nil || current < min
    end
    min
  end

  def max
    return nil if empty?
    max = nil
    (0..@top).each do |i|
      current = @store[i]
      max = current if max == nil || current > max
    end
    max
  end

  private

  def full?
    @top == (@size - 1)
  end

  def empty?
    @top == -1
  end
end
