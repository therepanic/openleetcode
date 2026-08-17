# @param {Integer} n
# @param {Integer[][]} edge_list
# @param {Integer[][]} queries
# @return {Boolean[]}
def distance_limited_paths_exist(n, edge_list, queries)
    parent = (0...n).to_a
    rank = Array.new(n, 0)
    
    find = ->(x) {
        if parent[x] != x
            parent[x] = find.call(parent[x])
        end
        parent[x]
    }
    
    union = ->(x, y) {
        xroot = find.call(x)
        yroot = find.call(y)
        return if xroot == yroot
        if rank[xroot] < rank[yroot]
            parent[xroot] = yroot
        elsif rank[xroot] > rank[yroot]
            parent[yroot] = xroot
        else
            parent[yroot] = xroot
            rank[xroot] += 1
        end
    }
    
    queries.each_with_index do |q, idx|
        q << idx
    end
    queries.sort_by! { |q| q[2] }
    edge_list.sort_by! { |e| e[2] }
    
    i = 0
    res = Array.new(queries.length, false)
    queries.each do |q|
        while i < edge_list.length && edge_list[i][2] < q[2]
            union.call(edge_list[i][0], edge_list[i][1])
            i += 1
        end
        if find.call(q[0]) == find.call(q[1])
            res[q[3]] = true
        end
    end
    res
end
