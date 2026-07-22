# @param {Integer} n
# @param {Integer[][]} edges
# @param {String} labels
# @return {Integer[]}
def count_sub_trees(n, edges, labels)
    matrix = Array.new(n) { [] }
    edges.each do |u, v|
        matrix[u] << v
        matrix[v] << u
    end

    parent = Array.new(n, -1)
    order = [0]
    order.each do |node|
        matrix[node].each do |child|
            if child != parent[node]
                parent[child] = node
                order << child
            end
        end
    end

    counts = Array.new(n) { Array.new(26, 0) }
    ans = Array.new(n, 0)
    order.reverse_each do |node|
        label = labels[node].ord - 97
        counts[node][label] += 1
        ans[node] = counts[node][label]
        if parent[node] != -1
            26.times do |i|
                counts[parent[node]][i] += counts[node][i]
            end
        end
    end
    ans
end
