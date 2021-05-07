class PolyTreeNode

  attr_accessor :value, :children
  attr_reader :parent

  def initialize(value = nil)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    return node if self.parent == node
     #reassigning
        pre_parent = self.parent
        @parent = node
        node.children << self if !node.nil?
        pre_parent.children.delete(self) if !pre_parent.nil?
        node
  end

  def add_child(child_node) # say n4 is a childnode we initialize for instance
    # we want n2 to point to n4, so we can write it as
    # the parent of n4 is n2. 
      child_node.parent = self   #
  end

  def remove_child(child_node)
    if !self.children.include?(child_node)
      raise "This node is not a child, cannot remove."
    end
    child_node.parent = nil
  end

  def dfs(target)
    return nil if self == nil
    return self if self.value == target
    self.children.each do |child|
      search = child.dfs(target)
      return search unless search.nil?
    end
    nil
  end

  def bfs(target)
    # Create the queue first
    return self if self.value == target 
    queue = []
    queue.push(self)
    until queue.empty? # until will evaluate this until the condition is false
      el = queue.shift  # right now el is equal to self
      if el.value == target
        return el 
      else
        el.children.each do |child|
          queue.push(child)
        end
      end
    end
    nil
  end   


end