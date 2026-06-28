# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_directed_connection(edges)
    n = edges.length
    parent = Array.new(n + 1, 0)
    uf_parent = (0..n).to_a
    rank = Array.new(n + 1, 0)
    
    def find(uf_parent, u)
        if uf_parent[u] != u
            uf_parent[u] = find(uf_parent, uf_parent[u])
        end
        uf_parent[u]
    end
    
    def union(uf_parent, rank, u, v)
        pu = find(uf_parent, u)
        pv = find(uf_parent, v)
        return false if pu == pv
        if rank[pu] < rank[pv]
            uf_parent[pu] = pv
        elsif rank[pv] < rank[pu]
            uf_parent[pv] = pu
        else
            uf_parent[pu] = pv
            rank[pv] += 1
        end
        true
    end
    
    candidate1 = nil
    candidate2 = nil
    
    edges.each do |u, v|
        if parent[v] != 0
            candidate1 = [parent[v], v]
            candidate2 = [u, v]
            break
        end
        parent[v] = u
    end
    
    edges.each do |u, v|
        next if candidate2 && [u, v] == candidate2
        unless union(uf_parent, rank, u, v)
            return candidate1 ? candidate1 : [u, v]
        end
    end
    
    candidate2
end
