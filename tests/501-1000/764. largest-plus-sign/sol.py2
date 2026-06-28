class Solution(object):
    def orderOfLargestPlusSign(self, n, mines):
        s = set(map(tuple, mines))
        dp = [[n] * n for _ in range(n)]
        for i in range(n):
            count = 0
            for j in range(n):
                count = 0 if (i, j) in s else count + 1
                dp[i][j] = min(dp[i][j], count)
            count = 0
            for j in range(n - 1, -1, -1):
                count = 0 if (i, j) in s else count + 1
                dp[i][j] = min(dp[i][j], count)
        for j in range(n):
            count = 0
            for i in range(n):
                count = 0 if (i, j) in s else count + 1
                dp[i][j] = min(dp[i][j], count)
            count = 0
            for i in range(n - 1, -1, -1):
                count = 0 if (i, j) in s else count + 1
                dp[i][j] = min(dp[i][j], count)
        return max(max(row) for row in dp)
