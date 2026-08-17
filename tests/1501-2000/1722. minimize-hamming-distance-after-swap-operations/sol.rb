# @param {Integer[]} source
# @param {Integer[]} target
# @param {Integer[][]} allowed_swaps
# @return {Integer}
def minimum_hamming_distance(source, target, allowed_swaps)
    n = source.length
    parent = (0...n).to_a
    
    find = ->(x) {
        if parent[x] != x
            parent[x] = find.call(parent[x])
        end
        parent[x]
    }
    
    unite = ->(a, b) {
        parent[find.call(a)] = find.call(b)
    }
    
    allowed_swaps.each do |a, b|
        unite.call(a, b)
    end
    
    groups = Hash.new { |h, k| h[k] = [] }
    (0...n).each do |i|
        groups[find.call(i)] << source[i]
    end
    groups = groups.transform_values { |vals| vals.tally }
    
    hamming_dist = 0
    (0...n).each do |i|
        root = find.call(i)
        freq = groups[root]
        if freq[target[i]].to_i > 0
            freq[target[i]] -= 1
        else
            hamming_dist += 1
        end
    end
    hamming_dist
end
