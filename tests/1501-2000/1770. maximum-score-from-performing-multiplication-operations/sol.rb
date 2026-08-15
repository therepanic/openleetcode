# @param {Integer[]} nums
# @param {Integer[]} multipliers
# @return {Integer}
def maximum_score(nums, multipliers)
    m = multipliers.length
    dp = Array.new(m + 1) { Array.new(m + 1) }
    
    f = lambda do |i, j|
        k = i + j
        return 0 if k == m
        return dp[i][j] unless dp[i][j].nil?
        
        back = multipliers[k] * nums[nums.length - 1 - j] + f.call(i, j + 1)
        front = multipliers[k] * nums[i] + f.call(i + 1, j)
        dp[i][j] = [front, back].max
        dp[i][j]
    end
    
    f.call(0, 0)
end
