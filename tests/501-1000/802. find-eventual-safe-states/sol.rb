# @param {Integer[][]} graph
# @return {Integer[]}
def eventual_safe_nodes(graph)
    n = graph.length
    state = Array.new(n, 0)  # 0: unvisited, 1: visiting, 2: safe
    safe = []

    dfs = lambda do |node|
        if state[node] > 0
            return state[node] == 2
        end
        
        state[node] = 1
        
        graph[node].each do |neighbor|
            if state[neighbor] == 1 || !dfs.call(neighbor)
                return false
            end
        end
        
        state[node] = 2
        return true
    end
    
    (0...n).each do |i|
        if dfs.call(i)
            safe << i
        end
    end
    
    safe
end
