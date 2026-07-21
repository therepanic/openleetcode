# @param {Integer[]} nums
# @return {Integer}
def max_sum_div_three(nums)
    n = nums.length
    minus = -(1 << 30)
    dp = [[0, 0, 0], [0, minus, minus]]
    nums.each_with_index do |x, i|
        x3 = x % 3
        (0...3).each do |mod|
            mod_prev = (3 + mod - x3) % 3
            take = x + dp[(i + 1) & 1][mod_prev]
            skip = dp[(i + 1) & 1][mod]
            dp[i & 1][mod] = [take, skip].max
        end
    end
    [0, dp[(n - 1) & 1][0]].max
end
