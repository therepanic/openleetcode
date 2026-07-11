# @param {String} s
# @return {Integer[][]}
def large_group_positions(s)
    left = 0
    intervals = []
    while left < s.length
        start = left
        while left + 1 < s.length && s[left + 1] == s[left]
            left += 1
        end
        if left - start >= 2
            intervals << [start, left]
        end
        left += 1
    end
    intervals
end
