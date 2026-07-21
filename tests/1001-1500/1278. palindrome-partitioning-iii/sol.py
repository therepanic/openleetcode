class Solution:
    def palindromePartition(self, s: str, k: int) -> int:
        n = len(s)
        c = [[0] * n for _ in range(n)]
        for l in range(2, n + 1):
            for i in range(n - l + 1):
                j = i + l - 1
                c[i][j] = (c[i + 1][j - 1] if l > 2 else 0) + (s[i] != s[j])
        dp = [[float("inf")] * (n + 1) for _ in range(k + 1)]
        dp[0][0] = 0
        for i in range(1, n + 1):
            dp[1][i] = c[0][i - 1]
        for p in range(2, k + 1):
            for i in range(p, n + 1):
                mn = float("inf")
                for t in range(p - 1, i):
                    mn = min(mn, dp[p - 1][t] + c[t][i - 1])
                dp[p][i] = mn
        return dp[k][n]
