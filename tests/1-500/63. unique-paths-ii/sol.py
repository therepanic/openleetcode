class Solution:
    def uniquePathsWithObstacles(self, nums):

        m, n = len(nums), len(nums[0])

        dp = [[0] * n for _ in range(m)]

        if nums[0][0] == 1:
            return 0

        dp[0][0] = 1

        for i in range(m):

            for j in range(n):

                if nums[i][j] == 1:
                    dp[i][j] = 0

                else:

                    if i > 0:
                        dp[i][j] += dp[i-1][j]

                    if j > 0:
                        dp[i][j] += dp[i][j-1]

        return dp[m-1][n-1]