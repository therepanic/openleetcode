# @param {Integer[]} tokens
# @param {Integer} power
# @return {Integer}
def bag_of_tokens_score(tokens, power)
    tokens.sort!
    n = tokens.length
    l = 0
    curr = 0
    
    while l < n && tokens[l] <= power
        power -= tokens[l]
        l += 1
        curr += 1
    end
    
    r = n - 1
    res = curr
    
    while l < r && curr > 0
        power += tokens[r]
        curr -= 1
        r -= 1
        
        while l <= r && tokens[l] <= power
            power -= tokens[l]
            l += 1
            curr += 1
        end
        res = [res, curr].max
    end
    
    res
end
