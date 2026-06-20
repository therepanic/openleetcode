# @param {Integer[]} nums
# @return {Boolean}
def can_partition(nums)
    total_sum = nums.sum
    return false if total_sum % 2 != 0
    target_sum = total_sum / 2
    dp = [false] * (target_sum + 1)
    dp[0] = true
    nums.each do |num|
        (target_sum).downto(num) do |curr_sum|
            dp[curr_sum] = dp[curr_sum] || dp[curr_sum - num]
        end
    end
    dp[target_sum]
end
