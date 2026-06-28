class Solution(object):
    def findPaths(self, m, n, maxMove, startRow, startColumn):
        MOD = 10**9 + 7
        dp = [[[0] * n for _ in range(m)] for _ in range(maxMove + 1)]
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        for move in range(1, maxMove + 1):
            for i in range(m):
                for j in range(n):
                    for dx, dy in directions:
                        x, y = i + dx, j + dy
                        if x < 0 or x >= m or y < 0 or y >= n:
                            dp[move][i][j] += 1
                        else:
                            dp[move][i][j] = (dp[move][i][j] + dp[move - 1][x][y]) % MOD

        return dp[maxMove][startRow][startColumn] % MOD
