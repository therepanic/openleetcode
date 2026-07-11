# @param {Integer[][]} graph
# @return {Integer}
def shortest_path_length(graph)
    n = graph.length
    return 0 if n == 1
    
    full = (1 << n) - 1
    visited = Array.new(n) { Array.new(1 << n, false) }
    queue = []
    
    n.times do |i|
        mask = 1 << i
        queue << [i, mask, 0]
        visited[i][mask] = true
    end
    
    while !queue.empty?
        node, mask, dist = queue.shift
        
        return dist if mask == full
        
        graph[node].each do |nei|
            new_mask = mask | (1 << nei)
            
            unless visited[nei][new_mask]
                visited[nei][new_mask] = true
                queue << [nei, new_mask, dist + 1]
            end
        end
    end
    
    -1
end
