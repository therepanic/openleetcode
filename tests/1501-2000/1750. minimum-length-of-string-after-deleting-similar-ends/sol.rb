# @param {String} s
# @return {Integer}
def minimum_length(s)
    left = 0
    right = s.length - 1
    while left < right && s[left] == s[right]
        ch = s[left]
        while left <= right && s[left] == ch
            left += 1
        end
        while left <= right && s[right] == ch
            right -= 1
        end
    end
    return [0, right - left + 1].max
end
