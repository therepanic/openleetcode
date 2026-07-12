class Solution:
    def numPermsDISequence(self, s: str) -> int:
        n = len(s)
        dp = [1]
        for i in range(1, n + 1):
            prefix = [0] * (i + 1)
            prefix[0] = dp[0]
            for j in range(1, i):
                prefix[j] = (prefix[j - 1] + dp[j]) % (10**9 + 7)
            prefix[i] = (prefix[i - 1]) % (10**9 + 7)
            ndp = [0] * (i + 1)
            if s[i - 1] == "I":
                for j in range(i + 1):
                    ndp[j] = prefix[j - 1] % (10**9 + 7) if j > 0 else 0
            else:
                for j in range(i + 1):
                    ndp[j] = (prefix[i - 1] - (prefix[j - 1] if j > 0 else 0)) % (
                        10**9 + 7
                    )
            dp = ndp
        return sum(dp) % (10**9 + 7)
