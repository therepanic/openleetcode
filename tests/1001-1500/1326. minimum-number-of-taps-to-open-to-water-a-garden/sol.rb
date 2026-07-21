# @param {Integer} n
# @param {Integer[]} ranges
# @return {Integer}
def min_taps(n, ranges)
    max_range = [0] * (n + 1)
    
    ranges.each_with_index do |r, i|
        left = [0, i - r].max
        right = [n, i + r].min
        max_range[left] = [max_range[left], right].max
    end
    
    end_pos = farthest = taps = 0
    i = 0
    
    while end_pos < n
        while i <= end_pos
            farthest = [farthest, max_range[i]].max
            i += 1
        end
        
        if farthest <= end_pos
            return -1
        end
        
        end_pos = farthest
        taps += 1
    end
    
    return taps
end
