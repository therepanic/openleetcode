# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def count_restricted_paths(n, edges)
    mod = 10**9 + 7
    graph = Hash.new { |h, k| h[k] = [] }
    edges.each do |u, v, w|
        graph[u] << [v, w]
        graph[v] << [u, w]
    end

    dist = Array.new(n + 1, Float::INFINITY)
    dist[n] = 0
    heap = [[0, n]]
    while !heap.empty?
        curr_dist, node = heap.shift
        next if curr_dist > dist[node]
        graph[node].each do |next_node, weight|
            new_dist = weight + curr_dist
            if new_dist < dist[next_node]
                dist[next_node] = new_dist
                heap << [new_dist, next_node]
                heap.sort_by! { |a| a[0] }
            end
        end
    end

    dp = Array.new(n + 1, 0)
    dp[n] = 1
    nodes = (1..n).to_a.sort_by { |x| dist[x] }
    nodes.each do |u|
        graph[u].each do |v, w|
            if dist[u] > dist[v]
                dp[u] = (dp[u] + dp[v]) % mod
            end
        end
    end
    dp[1]
end
