class Solution:
    def minDeletionSize(self, strs: list[str]) -> int:
        m = len(strs[0])
        dp = [1] * m

        for i in range(m):
            for j in range(i):
                if all(row[j] <= row[i] for row in strs):
                    dp[i] = max(dp[i], dp[j] + 1)

        return m - max(dp)
