# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} t
# @param {Integer} target
# @return {Float}
def frog_position(n, edges, t, target)
    neighbors = Hash.new { |h, k| h[k] = Set.new }
    edges.each do |a, b|
        neighbors[a].add(b)
        neighbors[b].add(a)
    end
    
    visited = Set.new
    probability = 0.0
    
    dfs = lambda do |vertex, chance, elapsed|
        if elapsed == t
            if vertex == target
                probability = chance
            end
            return
        end
        visited.add(vertex)
        choices = neighbors[vertex] - visited
        if choices.empty?
            dfs.call(vertex, chance, elapsed + 1)
        else
            choices.each do |child|
                dfs.call(child, chance / choices.size.to_f, elapsed + 1)
            end
        end
    end
    
    dfs.call(1, 1.0, 0)
    probability
end
