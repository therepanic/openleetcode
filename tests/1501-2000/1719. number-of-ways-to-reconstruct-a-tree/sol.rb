# @param {Integer[][]} pairs
# @return {Integer}
def check_ways(pairs)
    graph = {}
    pairs.each do |x, y|
        graph[x] ||= Set.new
        graph[y] ||= Set.new
        graph[x].add(y)
        graph[y].add(x)
    end

    return 0 if graph.empty?
    root = graph.max_by { |_, vals| vals.size }[0]
    return 0 if graph[root].size != graph.size - 1

    ans = 1
    graph.each do |node, neighbors|
        next if node == root
        parents = neighbors.select { |cand| graph[cand].size >= neighbors.size }
        return 0 if parents.empty?
        parent = parents.min_by { |cand| graph[cand].size }
        return 0 unless (neighbors - (graph[parent] | [parent])).empty?
        ans = 2 if neighbors.size == graph[parent].size
    end
    return ans
end
