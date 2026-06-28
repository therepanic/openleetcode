# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
    is_palindrome = lambda do |l, r|
        while l < r
            return false if s[l] != s[r]
            l += 1
            r -= 1
        end
        true
    end
    
    left = 0
    right = s.length - 1
    while left < right
        if s[left] != s[right]
            return is_palindrome.call(left + 1, right) || is_palindrome.call(left, right - 1)
        end
        left += 1
        right -= 1
    end
    true
end
