class PolyTreeNode
  attr_accessor :value, :parent, :children

  def initialize(value=nil)
    @value=value
    @parent=nil
    @children=[]
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent)
    return parent if self.parent == parent
    if self.parent
      self.parent._children.delete(self)
    end
    @parent=parent
    self.parent._children<<self unless self.parent.nil?
    self
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    if child && !self.children.include?(child)
      raise "Tried to remove node that isn't a child"
    end
    child.parent=nil
  end

  protected

  def _children
    @children
  end

  def dfs(target_value)
    if self.value == target_value
      return self
    else
      children.each do |child|
        child.dfs(target_value)
      end
    end
    nil
  end

  def bfs(target_value)
    array=[self]
    until array.empty?
      array.delete(array[0])
      if self.value == target_value
        return self
      end
      array += self._children
    end

    nil
  end

end
