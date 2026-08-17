# @param {Integer} n
# @param {Integer[]} cuts
# @return {Integer}
def min_cost(n, cuts)
    c = (cuts + [0, n]).sort
    m = c.length
    memo = {}
    
    optimize = lambda do |i, j|
        key = [i, j]
        return memo[key] if memo.key?(key)
        return 0 if j - i <= 1
        
        res = Float::INFINITY
        (i+1...j).each do |k|
            val = optimize.call(i, k) + optimize.call(k, j)
            res = val if val < res
        end
        memo[key] = res + (c[j] - c[i])
    end
    
    optimize.call(0, m - 1)
end
