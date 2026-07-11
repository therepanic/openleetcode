class Solution:
    def numFactoredBinaryTrees(self, arr: List[int]) -> int:
        MOD = 10**9 + 7
        arr.sort()
        dp = {}
        s = set(arr)
        for x in arr:
            dp[x] = 1
            for a in arr:
                if a > x:
                    break
                if x % a == 0:
                    b = x // a
                    if b in s:
                        dp[x] = (dp[x] + dp[a] * dp[b]) % MOD
        return sum(dp.values()) % MOD
