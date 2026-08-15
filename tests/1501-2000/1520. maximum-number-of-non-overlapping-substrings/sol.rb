# @param {String} s
# @return {String[]}
def max_num_of_substrings(s)
    n = s.length
    counts = Hash.new(0)
    s.each_char { |c| counts[c] += 1 }
    first = {}
    last = {}
    counts.each_key do |k|
        first[k] = s.index(k)
        last[k] = s.rindex(k)
    end
    
    res = []
    queue = []
    
    counts.each_key do |k|
        queue.unshift([first[k], last[k], counts[k]])
        left = Float::INFINITY
        right = -Float::INFINITY
        total = 0
        
        queue.each do |x, y, z|
            total += z
            left = [left, x].min
            right = [right, y].max
            if total == right - left + 1
                break
            end
        end
        
        if total == right - left + 1
            res << s[left..right]
            queue = []
        end
    end
    
    res
end
