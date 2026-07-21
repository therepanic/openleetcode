class Solution:
    def numberOfArrays(self, s: str, k: int) -> int:
        mod = 1000000007
        dp = [0] * (len(s) + 1)
        dp[0] = 1
        width = len(str(k))
        for i, digit in enumerate(s):
            if digit == "0" or dp[i] == 0:
                continue
            value = 0
            for j in range(i, min(len(s), i + width)):
                value = value * 10 + ord(s[j]) - 48
                if value > k:
                    break
                dp[j + 1] = (dp[j + 1] + dp[i]) % mod
        return dp[-1]
