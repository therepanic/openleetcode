# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_smallest_set_of_vertices(n, edges)
    has_incoming = {}
    edges.each do |edge|
        has_incoming[edge[1]] = true
    end
    (0...n).select { |i| !has_incoming[i] }
end
