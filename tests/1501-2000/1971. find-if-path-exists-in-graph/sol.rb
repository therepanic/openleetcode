# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} source
# @param {Integer} destination
# @return {Boolean}
def valid_path(n, edges, source, destination)
    return true if source == destination
    graph = Hash.new { |h, k| h[k] = [] }
    edges.each do |u, v|
        graph[u] << v
        graph[v] << u
    end
    queue = [source]
    visited = {source => true}
    until queue.empty?
        node = queue.shift
        return true if node == destination
        graph[node].each do |neighbor|
            unless visited[neighbor]
                visited[neighbor] = true
                queue << neighbor
            end
        end
    end
    false
end
