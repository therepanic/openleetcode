# @param {Integer[]} nums
# @return {Integer}
def number_of_arithmetic_slices(nums)
    n = nums.length
    total_count = 0
    dp = Array.new(n) { {} }

    (1...n).each do |i|
        (0...i).each do |j|
            diff = nums[i] - nums[j]
            dp[i][diff] = (dp[i][diff] || 0) + 1
            if dp[j].key?(diff)
                dp[i][diff] += dp[j][diff]
                total_count += dp[j][diff]
            end
        end
    end

    total_count
end
