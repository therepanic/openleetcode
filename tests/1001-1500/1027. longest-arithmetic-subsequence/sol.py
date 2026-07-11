from typing import List


class Solution:
    def longestArithSeqLength(self, nums: List[int]) -> int:
        n = len(nums)
        if n <= 2:
            return n
        dp = [{} for _ in range(n)]
        ans = 2
        for i in range(n):
            for j in range(i):
                d = nums[i] - nums[j]
                prev = dp[j].get(d, 1)
                dp[i][d] = max(dp[i].get(d, 0), prev + 1)
                ans = max(ans, dp[i][d])
        return ans
