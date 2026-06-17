# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
    prev_idx = -1
    dp = Array.new(2500) { Array.new(2500, -1) }
    helper(0, prev_idx, nums, dp)
end

def helper(i, prev_idx, nums, dp)
    if i >= nums.length
        return 0
    end
    if dp[i][prev_idx] != -1
        return dp[i][prev_idx]
    end
    steal = 0
    skip = 0
    if prev_idx == -1 || nums[prev_idx] < nums[i]
        steal = 1 + helper(i + 1, i, nums, dp)
    end
    skip = helper(i + 1, prev_idx, nums, dp)
    dp[i][prev_idx] = [steal, skip].max
    return [steal, skip].max
end
