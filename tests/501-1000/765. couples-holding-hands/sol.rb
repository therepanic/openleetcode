# @param {Integer[]} row
# @return {Integer}
def min_swaps_couples(row)
    n = row.length / 2
    parent = Array.new(n) { |i| i }
    
    find = lambda do |x|
        if parent[x] != x
            parent[x] = find.call(parent[x])
        end
        parent[x]
    end
    
    union = lambda do |a, b|
        pa = find.call(a)
        pb = find.call(b)
        if pa != pb
            parent[pa] = pb
        end
    end
    
    (0...row.length).step(2) do |i|
        couple1 = row[i] / 2
        couple2 = row[i+1] / 2
        union.call(couple1, couple2)
    end
    
    component_size = {}
    (0...n).each do |couple|
        root = find.call(couple)
        component_size[root] = (component_size[root] || 0) + 1
    end
    
    swaps = 0
    component_size.each_value do |size|
        swaps += size - 1
    end
    
    swaps
end
