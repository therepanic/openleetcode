# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}
def make_connected(n, connections)
    return -1 if connections.length < n - 1

    parent = (0...n).to_a
    size = Array.new(n, 1)

    find = ->(node) {
        if parent[node] != node
            parent[node] = find.call(parent[node])
        end
        parent[node]
    }

    union = ->(u, v) {
        pu = find.call(u)
        pv = find.call(v)
        return if pu == pv
        if size[pu] < size[pv]
            parent[pu] = pv
            size[pv] += size[pu]
        else
            parent[pv] = pu
            size[pu] += size[pv]
        end
    }

    extra = 0
    connections.each do |u, v|
        if find.call(u) == find.call(v)
            extra += 1
        else
            union.call(u, v)
        end
    end

    components = (0...n).count { |i| find.call(i) == i }
    extra >= components - 1 ? components - 1 : -1
end
