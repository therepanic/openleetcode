# @param {String} s
# @param {Integer[][]} pairs
# @return {String}
def smallest_string_with_swaps(s, pairs)
    n = s.length
    parent = (0...n).to_a
    
    find = ->(x) {
        if parent[x] != x
            parent[x] = find.call(parent[x])
        end
        parent[x]
    }
    
    union = ->(x, y) {
        rx = find.call(x)
        ry = find.call(y)
        if rx != ry
            parent[rx] = ry
        end
    }
    
    pairs.each { |i, j| union.call(i, j) }
    
    groups = Hash.new { |h, k| h[k] = [] }
    (0...n).each { |i| groups[find.call(i)] << i }
    
    res = Array.new(n)
    groups.each_value do |indices|
        chars = indices.map { |i| s[i] }
        indices.sort!
        chars.sort!
        indices.zip(chars).each { |idx, ch| res[idx] = ch }
    end
    
    res.join
end
