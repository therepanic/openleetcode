# @param {Integer[][]} graph
# @return {Boolean}
def is_bipartite(graph)
    n = graph.length
    colors = Array.new(n, -1)

    dfs = lambda do |u, curr_color|
        colors[u] = curr_color
        graph[u].each do |v|
            if colors[v] == -1
                return false unless dfs.call(v, 1 - curr_color)
            else
                return false if colors[v] == curr_color
            end
        end
        true
    end

    (0...n).each do |u|
        if colors[u] == -1
            return false unless dfs.call(u, 0)
        end
    end
    true
end
