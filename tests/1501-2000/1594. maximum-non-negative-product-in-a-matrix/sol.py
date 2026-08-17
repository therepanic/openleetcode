class Solution:
    def maxProductPath(self, grid: List[List[int]]) -> int:
        r, c, MOD = len(grid), len(grid[0]), 10**9 + 7
        dp = [[[0] * 2 for _ in range(c)] for _ in range(r)]

        p = dp[0][0][0] = dp[0][0][1] = grid[0][0]
        for j in range(1, c):
            p *= grid[0][j]
            dp[0][j][0] = dp[0][j][1] = p

        p = grid[0][0]
        for i in range(1, r):
            p *= grid[i][0]
            dp[i][0][0] = dp[i][0][1] = p
            for j in range(1, c):
                x = grid[i][j]
                xx = (
                    x * dp[i][j - 1][0],
                    x * dp[i][j - 1][1],
                    x * dp[i - 1][j][0],
                    x * dp[i - 1][j][1],
                )
                dp[i][j][0], dp[i][j][1] = min(xx), max(xx)
        ans = dp[r - 1][c - 1][1]
        return -1 if ans < 0 else ans % MOD
