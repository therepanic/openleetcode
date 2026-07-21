public class Solution {
    private const int MOD = 1_000_000_007;
    private int[,,] dp;
    private int n, m, k;

    public int NumOfArrays(int n, int m, int k) {
        this.n = n;
        this.m = m;
        this.k = k;
        dp = new int[n + 1, k + 1, m + 1];
        for (int i = 0; i <= n; i++)
            for (int j = 0; j <= k; j++)
                for (int l = 0; l <= m; l++)
                    dp[i, j, l] = -1;
        return Solve(0, 0, 0);
    }

    private int Solve(int idx, int searchCost, int maxValue) {
        if (idx == n) {
            return searchCost == k ? 1 : 0;
        }
        if (searchCost > k) {
            return 0;
        }
        if (dp[idx, searchCost, maxValue] != -1) {
            return dp[idx, searchCost, maxValue];
        }

        int result = 0;
        for (int i = 1; i <= m; i++) {
            if (i > maxValue) {
                result = (result + Solve(idx + 1, searchCost + 1, i)) % MOD;
            } else {
                result = (result + Solve(idx + 1, searchCost, maxValue)) % MOD;
            }
        }

        dp[idx, searchCost, maxValue] = result;
        return result;
    }
}
