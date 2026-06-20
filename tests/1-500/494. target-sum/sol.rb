# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def find_target_sum_ways(nums, target)
    total = nums.sum
    if target.abs > total || (target + total) % 2 != 0
        return 0
    end
    sum_ = (target + total) / 2
    dp = [0] * (sum_ + 1)
    dp[0] = 1

    nums.each do |num|
        sum_.downto(num) do |j|
            dp[j] += dp[j - num]
        end
    end

    dp[sum_]
end
