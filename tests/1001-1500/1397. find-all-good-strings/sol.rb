# @param {Integer} n
# @param {String} s1
# @param {String} s2
# @param {String} evil
# @return {Integer}
def find_good_strings(n, s1, s2, evil)
    mod = 10**9 + 7
    m = evil.length
    
    lps = [0] * m
    (1...m).each do |i|
        j = lps[i - 1]
        while j > 0 && evil[i] != evil[j]
            j = lps[j - 1]
        end
        if evil[i] == evil[j]
            lps[i] = j + 1
        end
    end
    
    memo = {}
    
    get_next_state = lambda do |curr_match, char|
        while curr_match > 0 && char != evil[curr_match]
            curr_match = lps[curr_match - 1]
        end
        if char == evil[curr_match]
            curr_match += 1
        end
        curr_match
    end
    
    dp = lambda do |idx, e_idx, tight_lo, tight_hi|
        key = [idx, e_idx, tight_lo, tight_hi]
        return memo[key] if memo.key?(key)
        
        if e_idx == m
            memo[key] = 0
            return 0
        end
        if idx == n
            memo[key] = 1
            return 1
        end
        
        res = 0
        lower = tight_lo ? s1[idx] : 'a'
        upper = tight_hi ? s2[idx] : 'z'
        
        (lower.ord..upper.ord).each do |char_code|
            c = char_code.chr
            
            next_e_idx = get_next_state.call(e_idx, c)
            next_tight_lo = tight_lo && (c == lower)
            next_tight_hi = tight_hi && (c == upper)
            
            res = (res + dp.call(idx + 1, next_e_idx, next_tight_lo, next_tight_hi)) % mod
        end
        
        memo[key] = res
        res
    end
    
    dp.call(0, 0, true, true)
end
