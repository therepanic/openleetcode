# @param {Integer[]} nums
# @return {Integer}
def max_score(nums)
    n = nums.length
    dp = Array.new(1 << n) { Array.new(n/2 + 1, -1) }

    gcd_func = ->(a, b) {
        while b != 0
            a, b = b, a % b
        end
        a
    }

    dfs = lambda do |mask, op|
        return 0 if mask == (1 << n) - 1
        return dp[mask][op] if dp[mask][op] != -1

        ans = 0
        (0...n).each do |i|
            next if (mask & (1 << i)) != 0
            (0...n).each do |j|
                next if j == i || (mask & (1 << j)) != 0
                nmask = mask | (1 << i) | (1 << j)
                val = dfs.call(nmask, op + 1) + gcd_func.call(nums[i], nums[j]) * op
                ans = [ans, val].max
            end
        end
        dp[mask][op] = ans
        ans
    end

    dfs.call(0, 1)
end
