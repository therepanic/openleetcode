# @param {String[]} equations
# @return {Boolean}
def equations_possible(equations)
    parent = (0..25).to_a
    rank = Array.new(26, 0)

    find = lambda do |x|
        if parent[x] != x
            parent[x] = find.call(parent[x])
        end
        parent[x]
    end

    union = lambda do |a, b|
        ra = find.call(a)
        rb = find.call(b)
        return if ra == rb
        if rank[ra] < rank[rb]
            parent[ra] = rb
        elsif rank[ra] > rank[rb]
            parent[rb] = ra
        else
            parent[rb] = ra
            rank[ra] += 1
        end
    end

    equations.each do |eq|
        if eq[1] == "="
            union.call(eq[0].ord - "a".ord, eq[3].ord - "a".ord)
        end
    end

    equations.each do |eq|
        if eq[1] == "!" && find.call(eq[0].ord - "a".ord) == find.call(eq[3].ord - "a".ord)
            return false
        end
    end
    true
end
