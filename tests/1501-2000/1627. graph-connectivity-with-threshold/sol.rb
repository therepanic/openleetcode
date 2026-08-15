# @param {Integer} n
# @param {Integer} threshold
# @param {Integer[][]} queries
# @return {Boolean[]}
def are_connected(n, threshold, queries)
    limit = [n, *queries.map(&:to_a).flatten].max
    parent = (0..limit).to_a
    rank = [1] * (limit + 1)

    find = ->(x) do
        res = x
        while res != parent[res]
            parent[res] = parent[parent[res]]
            res = parent[res]
        end
        res
    end

    union = ->(a, b) do
        p1, p2 = find.call(a), find.call(b)
        return false if p1 == p2
        if rank[p1] > rank[p2]
            parent[p2] = p1
            rank[p1] += rank[p2]
        else
            parent[p1] = p2
            rank[p2] += rank[p1]
        end
        true
    end

    (threshold + 1..limit).each do |i|
        (2 * i..limit).step(i).each do |j|
            union.call(i, j)
        end
    end

    queries.map { |x, y| find.call(x) == find.call(y) }
end
