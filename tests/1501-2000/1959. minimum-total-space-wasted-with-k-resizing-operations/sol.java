class Solution {
    public int minSpaceWastedKResizing(int[] nums, int k) {
        int n = nums.length;
        int[] P = new int[n + 1];
        for (int i = 0; i < n; i++) {
            P[i+1] = P[i] + nums[i];
        }
        int inf = 1000000000;
        int[] dp = new int[n + 1];
        Arrays.fill(dp, inf);
        int max_v = 0;
        for (int i = 1; i <= n; i++) {
            max_v = Math.max(max_v, nums[i-1]);
            dp[i] = max_v * i - P[i];
        }
        for (int t = 0; t < k; t++) {
            int[] new_dp = new int[n + 1];
            Arrays.fill(new_dp, inf);
            new_dp[0] = 0;
            for (int i = 1; i <= n; i++) {
                int cur_max = 0;
                for (int j = i - 1; j >= 0; j--) {
                    cur_max = Math.max(cur_max, nums[j]);
                    int waste = cur_max * (i - j) - (P[i] - P[j]);
                    if (dp[j] != inf) new_dp[i] = Math.min(new_dp[i], dp[j] + waste);
                }
            }
            dp = new_dp;
        }
        return dp[n];
    }
}
