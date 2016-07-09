module BinarySearchTree
  class Node
    attr_reader :value
    attr_accessor :left_child, :right_child

    def initialize(val)
      @value = val
    end

    def inspect
      "{#{value}::#{left_child.inspect}|#{right_child.inspect}}"
    end

    def insert(val)
      case value <=> val
      when 1 then left_child.insert(val)
      when -1 then right_child.insert(val)
      when 0 then false
      end
    end

    def include?(val)
      case value <=> val
      when 1 then left_child.include?(val)
      when -1 then right_child.include?(val)
      when 0 then true
      end
    end

    private

    def insert_left(value)
      left_child.insert(v) or self.left_child = Node.new(v)
    end

    def insert_right(value)
      right_child.insert(v) or self.right_child = Node.new(v)
    end
  end

  class EmptyNode
    def initialize(val)
      @value = val
      @left_child = EmptyNode.new
      @right_child = EmptyNode.new
    end

    def inspect(*)
      "{}"
    end

    def include?(*)
      false
    end

    def insert(*)
      false
    end
  end
end
