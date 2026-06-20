class Solution {
    public int[] countBits(int n) {
        int[] dp = new int[n + 1];
        int sub = 1;
        for (int i = 1; i <= n; i++) {
            if (sub * 2 == i) {
                sub = i;
            }
            dp[i] = dp[i - sub] + 1;
        }
        return dp;
    }
}
