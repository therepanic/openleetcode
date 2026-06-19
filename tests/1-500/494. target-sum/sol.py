class Solution(object):
    def findTargetSumWays(self, nums, target):
        total = sum(nums)
        if abs(target) > total or (target + total) % 2 != 0:
            return 0
        sum_ = (target + total) // 2
        dp = [0] * (sum_ + 1)
        dp[0] = 1

        for num in nums:
            for j in range(sum_, num - 1, -1):
                dp[j] += dp[j - num]

        return dp[sum_]
