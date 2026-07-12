# @param {Integer} n
# @param {Integer[][]} dislikes
# @return {Boolean}
def possible_bipartition(n, dislikes)
    graph = {}
    dislikes.each do |u, v|
        graph[u] = [] unless graph.key?(u)
        graph[v] = [] unless graph.key?(v)
        graph[u] << v
        graph[v] << u
    end
    
    color = Array.new(n + 1, 0)
    
    (1..n).each do |node|
        next if color[node] != 0 || !graph.key?(node)
        
        queue = [node]
        color[node] = 1
        
        until queue.empty?
            curr = queue.shift
            
            graph[curr].each do |neighbor|
                return false if color[neighbor] == color[curr]
                
                if color[neighbor] == 0
                    color[neighbor] = -color[curr]
                    queue.push(neighbor)
                end
            end
        end
    end
    
    true
end
