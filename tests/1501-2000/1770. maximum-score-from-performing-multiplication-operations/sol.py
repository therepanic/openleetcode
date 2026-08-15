class Solution:
    def maximumScore(self, nums: List[int], multipliers: List[int]) -> int:
        m = len(multipliers)
        dp = [[None] * (m + 1) for _ in range(m + 1)]

        def f(i, j):
            k = i + j

            if k == m:
                return 0

            if dp[i][j] is not None:
                return dp[i][j]

            back = multipliers[k] * nums[len(nums) - 1 - j] + f(i, j + 1)

            front = multipliers[k] * nums[i] + f(i + 1, j)

            dp[i][j] = max(front, back)
            return dp[i][j]

        return f(0, 0)
