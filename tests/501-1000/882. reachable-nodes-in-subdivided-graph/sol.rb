# @param {Integer[][]} edges
# @param {Integer} max_moves
# @param {Integer} n
# @return {Integer}
def reachable_nodes(edges, max_moves, n)
    graph = Array.new(n) { [] }
    dist = Array.new(n, max_moves + 1)
    
    edges.each do |u, v, cnt|
        graph[u] << [v, cnt]
        graph[v] << [u, cnt]
    end
    
    dist[0] = 0
    heap = [[0, 0]]
    
    while !heap.empty?
        d, u = heap.shift
        next if d != dist[u] || d > max_moves
        graph[u].each do |v, w|
            new_dist = d + w + 1
            if new_dist < dist[v]
                dist[v] = new_dist
                heap << [new_dist, v]
                heap.sort_by! { |a, b| a[0] <=> b[0] }
            end
        end
    end
    
    reachable_nodes = dist.count { |d| d <= max_moves }
    reachable_subnodes = 0
    
    edges.each do |u, v, cnt|
        a = dist[u] > max_moves ? 0 : [max_moves - dist[u], cnt].min
        b = dist[v] > max_moves ? 0 : [max_moves - dist[v], cnt].min
        reachable_subnodes += [a + b, cnt].min
    end
    
    reachable_nodes + reachable_subnodes
end
