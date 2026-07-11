class Solution {
    public int maxSumAfterPartitioning(int[] arr, int k) {
        int n = arr.length;
        int[] dp = new int[n + 1];
        for (int i = 1; i <= n; i++) {
            int curr = 0;
            for (int j = 1; j <= k; j++) {
                if (i < j) break;
                curr = Math.max(curr, arr[i - j]);
                dp[i] = Math.max(dp[i], dp[i - j] + curr * j);
            }
        }
        return dp[n];
    }
}
