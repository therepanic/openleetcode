# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}
def min_reorder(n, connections)
    roads = Set.new
    graph = Hash.new { |h, k| h[k] = [] }
    connections.each do |x, y|
        graph[x] << y
        graph[y] << x
        roads.add([x, y])
    end
    
    seen = Set.new([0])
    dfs = lambda do |node|
        ans = 0
        graph[node].each do |neighbor|
            unless seen.include?(neighbor)
                ans += 1 if roads.include?([node, neighbor])
                seen.add(neighbor)
                ans += dfs.call(neighbor)
            end
        end
        ans
    end
    
    dfs.call(0)
end
