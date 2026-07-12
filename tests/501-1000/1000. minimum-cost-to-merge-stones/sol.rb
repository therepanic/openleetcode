# @param {Integer[]} stones
# @param {Integer} k
# @return {Integer}
def merge_stones(stones, k)
    n = stones.length
    return -1 if (n - 1) % (k - 1) != 0
    
    prefix = [0] * (n + 1)
    (1..n).each { |i| prefix[i] = prefix[i-1] + stones[i-1] }
    
    memo = {}
    
    optimize = lambda do |i, j, p|
        key = [i, j, p]
        return memo[key] if memo.key?(key)
        
        if i == j
            return memo[key] = (p == 1 ? 0 : Float::INFINITY)
        end
        
        if p == 1
            val = optimize.call(i, j, k) + (prefix[j+1] - prefix[i])
            return memo[key] = val
        end
        
        res = Float::INFINITY
        (i...j).step(k - 1) do |m|
            val = optimize.call(i, m, 1) + optimize.call(m+1, j, p-1)
            res = val if val < res
        end
        memo[key] = res
    end
    
    ans = optimize.call(0, n-1, 1)
    ans == Float::INFINITY ? -1 : ans.to_i
end
