public class Solution {
    public int MinSpaceWastedKResizing(int[] nums, int k) {
        int n = nums.Length;
        int[] P = new int[n + 1];
        for (int i = 0; i < n; i++) {
            P[i+1] = P[i] + nums[i];
        }
        int inf = 1000000000;
        int[] dp = Enumerable.Repeat(inf, n + 1).ToArray();
        int max_v = 0;
        for (int i = 1; i <= n; i++) {
            max_v = Math.Max(max_v, nums[i-1]);
            dp[i] = max_v * i - P[i];
        }
        for (int t = 0; t < k; t++) {
            int[] new_dp = Enumerable.Repeat(inf, n + 1).ToArray();
            new_dp[0] = 0;
            for (int i = 1; i <= n; i++) {
                int cur_max = 0;
                for (int j = i - 1; j >= 0; j--) {
                    cur_max = Math.Max(cur_max, nums[j]);
                    int waste = cur_max * (i - j) - (P[i] - P[j]);
                    if (dp[j] != inf) new_dp[i] = Math.Min(new_dp[i], dp[j] + waste);
                }
            }
            dp = new_dp;
        }
        return dp[n];
    }
}
