class UnionFind
    def initialize(n); @parent = (0...n).to_a; end
    def find_parent(p); @parent[p] == p ? p : @parent[p] = find_parent(@parent[p]); end
    def union(u, v); @parent[find_parent(u)] = find_parent(v); end
end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[][]}
def find_critical_and_pseudo_critical_edges(n, edges)
    def find_mst(n, edges, block, e)
        uf = UnionFind.new(n)
        weight = 0
        if e != -1
            weight += edges[e][2]
            uf.union(edges[e][0], edges[e][1])
        end
        edges.each_with_index do |edge, i|
            next if i == block
            next if uf.find_parent(edge[0]) == uf.find_parent(edge[1])
            uf.union(edge[0], edge[1])
            weight += edge[2]
        end
        (0...n).each do |i|
            return Float::INFINITY if uf.find_parent(i) != uf.find_parent(0)
        end
        weight
    end

    edges.each_with_index { |edge, i| edge << i }
    edges.sort_by! { |e| e[2] }
    mstwt = find_mst(n, edges, -1, -1)
    critical = []
    pseudo_critical = []
    edges.each_with_index do |edge, i|
        if mstwt < find_mst(n, edges, i, -1)
            critical << edge[3]
        elsif mstwt == find_mst(n, edges, -1, i)
            pseudo_critical << edge[3]
        end
    end
    [critical, pseudo_critical]
end
