# @param {Integer} n
# @param {Integer[][]} edges
# @param {Boolean[]} has_apple
# @return {Integer}
def min_time(n, edges, has_apple)
    adj = Array.new(n) { [] }
    degree = Array.new(n, 0)

    edges.each do |u, v|
        adj[u] << v
        adj[v] << u
        degree[u] += 1
        degree[v] += 1
    end

    q = []
    (1...n).each do |i|
        if degree[i] == 1 && !has_apple[i]
            q << i
        end
    end

    keep = Array.new(n, true)

    while !q.empty?
        u = q.shift
        keep[u] = false

        adj[u].each do |v|
            degree[v] -= 1
            if v != 0 && keep[v] && !has_apple[v] && degree[v] == 1
                q << v
            end
        end
    end

    active_nodes = keep.count(true)
    [(active_nodes - 1) * 2, 0].max
end
