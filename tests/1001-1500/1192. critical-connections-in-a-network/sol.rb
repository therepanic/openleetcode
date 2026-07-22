# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer[][]}
def critical_connections(n, connections)
    graph = Hash.new { |h, k| h[k] = [] }
    connections.each do |u, v|
        graph[u] << v
        graph[v] << u
    end
    
    disc = Array.new(n, -1)
    low = Array.new(n, 0)
    timer = [0]
    bridges = []
    
    (0...n).each do |start|
        next if disc[start] != -1
        
        stack = [[start, -1, graph[start].each]]
        disc[start] = low[start] = timer[0]
        timer[0] += 1
        
        while !stack.empty?
            node, parent, nbrs = stack.last
            begin
                nb = nbrs.next
                if nb == parent
                    next
                end
                
                if disc[nb] == -1
                    disc[nb] = low[nb] = timer[0]
                    timer[0] += 1
                    stack.push([nb, node, graph[nb].each])
                else
                    low[node] = [low[node], disc[nb]].min
                end
            rescue StopIteration
                stack.pop
                if !stack.empty?
                    par = stack.last[0]
                    low[par] = [low[par], low[node]].min
                    if low[node] > disc[par]
                        bridges << [par, node]
                    end
                end
            end
        end
    end
    
    bridges
end
