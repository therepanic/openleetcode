class Solution:
    def numMusicPlaylists(self, n: int, goal: int, k: int) -> int:
        MOD = 10**9 + 7
        dp = [[0 for _ in range(n + 1)] for _ in range(2)]
        dp[0][0] = 1

        for i in range(1, goal + 1):
            dp[i % 2][0] = 0
            for j in range(1, min(i, n) + 1):
                dp[i % 2][j] = dp[(i - 1) % 2][j - 1] * (n - (j - 1)) % MOD
                if j > k:
                    dp[i % 2][j] = (dp[i % 2][j] + dp[(i - 1) % 2][j] * (j - k)) % MOD

        return dp[goal % 2][n]
