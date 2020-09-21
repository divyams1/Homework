class GraphNode 
    attr_accessor :val, :neighbors 

    def initialize(val)
        @val = val 
        @neighbors = [] 
    end

  

end 
a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(starting_node, target_value)
    line =  [starting_node]
    visited = [] 
    until line.empty? 
        ele = line.shift 
        visited << ele 
        return ele if ele.val == target_value 
        ele.neighbors.each do |neighbor| 
            line << neighbor if !visited.include?(neighbor)
        end 
    end 
    nil 
end

p bfs(a, "b")
p bfs(a, "f")