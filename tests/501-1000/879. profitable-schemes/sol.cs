public class Solution {
    public int ProfitableSchemes(int n, int minProfit, int[] group, int[] profit) {
        int mod = (int)1e9 + 7;
        int[,] dp = new int[n + 1, minProfit + 1];
        dp[0, 0] = 1;
        for (int k = 1; k <= group.Length; k++) {
            int g = group[k - 1];
            int p = profit[k - 1];
            for (int i = n; i >= g; i--) {
                for (int j = minProfit; j >= 0; j--) {
                    int prev = j - p >= 0 ? dp[i - g, j - p] : dp[i - g, 0];
                    dp[i, j] = (dp[i, j] + prev) % mod;
                }
            }
        }
        int ans = 0;
        for (int i = 0; i <= n; i++) {
            ans = (ans + dp[i, minProfit]) % mod;
        }
        return ans;
    }
}
