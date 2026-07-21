class Solution:
    def maxSumDivThree(self, nums: List[int]) -> int:
        n, minus = len(nums), -(1 << 30)
        dp = [[0, 0, 0], [0, minus, minus]]
        for i, x in enumerate(nums):
            x3 = x % 3
            for mod in range(3):
                modPrev = (3 + mod - x3) % 3
                take = x + dp[(i + 1) & 1][modPrev]
                skip = dp[(i + 1) & 1][mod]
                dp[i & 1][mod] = max(take, skip)
        return max(0, dp[(n - 1) & 1][0])
