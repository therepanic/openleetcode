class Solution {
    private static final int MOD = 1_000_000_007;
    private Integer[][][] dp;
    private int n, m, k;

    public int numOfArrays(int n, int m, int k) {
        this.n = n;
        this.m = m;
        this.k = k;
        dp = new Integer[n + 1][k + 1][m + 1];
        return solve(0, 0, 0);
    }

    private int solve(int idx, int searchCost, int maxValue) {
        if (idx == n) {
            return searchCost == k ? 1 : 0;
        }
        if (searchCost > k) {
            return 0;
        }
        if (dp[idx][searchCost][maxValue] != null) {
            return dp[idx][searchCost][maxValue];
        }

        int result = 0;
        for (int i = 1; i <= m; i++) {
            if (i > maxValue) {
                result = (result + solve(idx + 1, searchCost + 1, i)) % MOD;
            } else {
                result = (result + solve(idx + 1, searchCost, maxValue)) % MOD;
            }
        }

        dp[idx][searchCost][maxValue] = result;
        return result;
    }
}
