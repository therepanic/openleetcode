class Solution(object):
    def largestSumOfAverages(self, nums, k):
        n = len(nums)
        pref = [0]
        for x in nums:
            pref.append(pref[-1] + x)
        # dp[i][p] – first i elements into p groups
        dp = [[0] * (k + 1) for _ in range(n + 1)]
        for i in range(1, n + 1):
            dp[i][1] = pref[i] / float(i)
        for p in range(2, k + 1):
            for i in range(p, n + 1):
                best = 0.0
                for j in range(p - 1, i):
                    best = max(best, dp[j][p - 1] + (pref[i] - pref[j]) / float(i - j))
                dp[i][p] = best
        return dp[n][k]
