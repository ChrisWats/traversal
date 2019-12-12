# It will implement two classic algorithms using depth-first search and breadth-first search.
class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

def collect_nodes(nodes)
  nodelist = []
  nodes.each do |node|
    node.children.each do |child|
      nodelist.push(child)
    end
  end
  return nodelist
end

def dfs(node, search_value)
  # depth-first search: start with node payload
  if node.payload == search_value
    puts "Found value #{node.payload}"
    return node
  else
    if node.children.length != 0
      node.children.each do |child|
        puts "Current child #{child.payload}"
        if dfs(child, search_value) != nil
          return child
        end
      end
    else
      return nil   
    end
  end
end

def bfs(node, search_value)
  # breadth-first search
  sticks = []
  if node.payload == search_value
    puts "Found value #{node.payload}"
    return node
  else node.children.length != 0
    sticks = collect_nodes([node])
  end

  while(sticks.length > 0) do 
    sticks.each do |stick|
      if stick.payload == search_value
        puts "Current child #{stick.payload}"
        return stick
      else
        puts "Current child #{stick.payload}"
      end
    end
    sticks = collect_nodes(sticks)
  end
end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])
dfs(trunk, 11)
puts "-----"
bfs(trunk, 11)