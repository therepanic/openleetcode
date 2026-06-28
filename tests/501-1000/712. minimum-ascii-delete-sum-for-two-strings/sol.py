class Solution:
    def minimumDeleteSum(self, s1: str, s2: str) -> int:
        n, m = len(s1), len(s2)

        # dp[i][j] = maximum ASCII sum of common subsequence
        dp = [[0] * (m + 1) for _ in range(n + 1)]

        for i in range(n):
            for j in range(m):
                if s1[i] == s2[j]:
                    dp[i + 1][j + 1] = dp[i][j] + ord(s1[i])
                else:
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])

        total_ascii = sum(ord(c) for c in s1) + sum(ord(c) for c in s2)
        return total_ascii - 2 * dp[n][m]
