class Solution:
    def finding(self, i, j, grid, dp):
        if grid[i][j] == 0:
            dp[i][j] = -1
            return -1

        if dp[i][j] != -2:
            return dp[i][j]

        if i + 1 >= len(grid) or j - 1 < 0 or j + 1 >= len(grid[0]):
            dp[i][j] = 0
            return 0

        temp = min(
            self.finding(i + 1, j, grid, dp),
            self.finding(i + 1, j - 1, grid, dp),
            self.finding(i + 1, j + 1, grid, dp),
        )

        dp[i][j] = 1 + temp
        return dp[i][j]

    def findingInv(self, i, j, grid, dp):
        if grid[i][j] == 0:
            dp[i][j] = -1
            return -1

        if dp[i][j] != -2:
            return dp[i][j]

        if i - 1 < 0 or j - 1 < 0 or j + 1 >= len(grid[0]):
            dp[i][j] = 0
            return 0

        temp = min(
            self.findingInv(i - 1, j, grid, dp),
            self.findingInv(i - 1, j - 1, grid, dp),
            self.findingInv(i - 1, j + 1, grid, dp),
        )

        dp[i][j] = 1 + temp
        return dp[i][j]

    def countPyramids(self, grid):
        m, n = len(grid), len(grid[0])
        ans = 0

        dp1 = [[-2] * n for _ in range(m)]

        for i in range(m - 1, -1, -1):
            for j in range(n - 1, -1, -1):
                if grid[i][j]:
                    ans += self.finding(i, j, grid, dp1)

        dp2 = [[-2] * n for _ in range(m)]

        for i in range(m):
            for j in range(n):
                if grid[i][j]:
                    ans += self.findingInv(i, j, grid, dp2)

        return ans