# @param {String} s
# @return {String}
def reverse_parentheses(s)
    @i = 0
    helper(s)
end

def helper(s)
    ans = ""
    while @i < s.length
        if s[@i] == '('
            @i += 1
            ans += helper(s)
        elsif s[@i] == ')'
            @i += 1
            return ans.reverse
        else
            ans += s[@i]
            @i += 1
        end
    end
    ans
end
