class Solution:
    def minInsertions(self, s: str) -> int:
        n = len(s)
        s2 = s[::-1]  # The exact reverse of the string

        # DP table to find the Longest Common Subsequence (LCS)
        dp = [[0] * (n + 1) for _ in range(n + 1)]

        for i in range(1, n + 1):
            for j in range(1, n + 1):
                # If characters match, add 1 to the previous diagonal state
                if s[i - 1] == s2[j - 1]:
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                # Otherwise, carry forward the best maximum state
                else:
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])

        # Total length minus the already symmetrical portion
        return n - dp[n][n]
