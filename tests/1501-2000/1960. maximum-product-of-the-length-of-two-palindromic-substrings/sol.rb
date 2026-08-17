# @param {String} s
# @return {Integer}
def max_product(s)
    n = s.length
    
    # Manacher (odd length only)
    d = Array.new(n, 0)
    l = 0
    r = -1
    
    for i in 0...n
        if i > r
            k = 1
        else
            k = [d[l + r - i], r - i + 1].min
        end
        
        while i - k >= 0 && i + k < n && s[i - k] == s[i + k]
            k += 1
        end
        
        d[i] = k
        
        if i + k - 1 > r
            l = i - k + 1
            r = i + k - 1
        end
    end
    
    # left[i] = max palindrome ending at i
    left = Array.new(n, 0)
    
    for i in 0...n
        radius = d[i]
        length = 2 * radius - 1
        end_idx = i + radius - 1
        left[end_idx] = [left[end_idx], length].max
    end
    
    # propagate backwards (reduce by 2)
    (n - 2).downto(0) do |i|
        left[i] = [left[i], left[i + 1] - 2].max
    end
    
    # prefix max
    for i in 1...n
        left[i] = [left[i], left[i - 1]].max
    end
    
    
    # right[i] = max palindrome starting at i
    right = Array.new(n, 0)
    
    for i in 0...n
        radius = d[i]
        length = 2 * radius - 1
        start_idx = i - radius + 1
        right[start_idx] = [right[start_idx], length].max
    end
    
    # propagate forward (reduce by 2)
    for i in 1...n
        right[i] = [right[i], right[i - 1] - 2].max
    end
    
    # suffix max
    (n - 2).downto(0) do |i|
        right[i] = [right[i], right[i + 1]].max
    end
    
    
    # try all splits
    ans = 0
    for i in 0...(n - 1)
        ans = [ans, left[i] * right[i + 1]].max
    end
    
    return ans
end
