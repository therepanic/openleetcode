class Solution:
    def cherryPickup(self, grid: List[List[int]]) -> int:
        m, n = len(grid), len(grid[0])
        dp = [[[-1] * n for _ in range(n)] for _ in range(m)]
        dp[0][0][n - 1] = grid[0][0] + grid[0][n - 1]

        for i in range(1, m):
            for j in range(n):
                for k in range(j + 1, n):
                    for x in range(-1, 2):
                        for y in range(-1, 2):
                            if 0 <= j + x < n and 0 <= k + y < n:
                                prev = dp[i - 1][j + x][k + y]
                                if prev != -1:
                                    dp[i][j][k] = max(
                                        dp[i][j][k],
                                        prev
                                        + grid[i][j]
                                        + (grid[i][k] if j != k else 0),
                                    )

        ans = max(max(row) for row in dp[m - 1])
        return ans if ans != -1 else 0
