class Solution:
    def profitableSchemes(
        self, n: int, minProfit: int, group: List[int], profit: List[int]
    ) -> int:
        mod = int(1e9) + 7
        dp = [[0] * (minProfit + 1) for _ in range(n + 1)]
        dp[0][0] = 1
        for k in range(1, len(group) + 1):
            g = group[k - 1]
            p = profit[k - 1]
            for i in range(n, g - 1, -1):
                for j in range(minProfit, -1, -1):
                    dp[i][j] = (dp[i][j] + dp[i - g][max(0, j - p)]) % mod
        return sum(dp[i][minProfit] for i in range(n + 1)) % mod
