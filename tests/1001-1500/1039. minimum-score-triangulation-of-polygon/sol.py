class Solution:
    def minScoreTriangulation(self, values: list[int]) -> int:
        n = len(values)
        dp = [[0] * n for _ in range(n)]
        for i in range(n - 1, -1, -1):
            for j in range(i + 1, n):
                for k in range(i + 1, j):
                    dp[i][j] = min(
                        dp[i][j] if dp[i][j] != 0 else float("inf"),
                        dp[i][k] + values[i] * values[k] * values[j] + dp[k][j],
                    )
        return dp[0][n - 1]
