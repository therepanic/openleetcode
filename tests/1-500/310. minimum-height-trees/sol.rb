# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_min_height_trees(n, edges)
    if n < 3
        return (0...n).to_a
    end

    adjacency_list = Array.new(n) { Set.new }
    edges.each do |a, b|
        adjacency_list[a].add(b)
        adjacency_list[b].add(a)
    end

    leaves = (0...n).select { |i| adjacency_list[i].size == 1 }

    while n > 2
        n -= leaves.size
        new_leaves = []
        leaves.each do |leaf|
            neighbor = adjacency_list[leaf].first
            adjacency_list[leaf].delete(neighbor)
            adjacency_list[neighbor].delete(leaf)
            if adjacency_list[neighbor].size == 1
                new_leaves << neighbor
            end
        end
        leaves = new_leaves
    end

    leaves
end
