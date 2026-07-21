# @param {Integer} n
# @param {Integer[][]} edges
# @param {Float[]} succ_prob
# @param {Integer} start_node
# @param {Integer} end_node
# @return {Float}
def max_probability(n, edges, succ_prob, start_node, end_node)
    dist = Array.new(n, 0.0)
    dist[start_node] = 1.0
    
    (n - 1).times do
        updated = false
        edges.each_with_index do |(u, v), i|
            if dist[u] * succ_prob[i] > dist[v]
                dist[v] = dist[u] * succ_prob[i]
                updated = true
            end
            if dist[v] * succ_prob[i] > dist[u]
                dist[u] = dist[v] * succ_prob[i]
                updated = true
            end
        end
        break unless updated
    end
    
    dist[end_node]
end
