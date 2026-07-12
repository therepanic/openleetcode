public class Solution {
    public double LargestSumOfAverages(int[] nums, int k) {
        int n = nums.Length;
        int[] pref = new int[n+1];
        for (int i = 0; i < n; i++) {
            pref[i+1] = pref[i] + nums[i];
        }
        double[,] dp = new double[n+1, k+1];
        for (int i = 1; i <= n; i++) {
            dp[i,1] = (double)pref[i] / i;
        }
        for (int p = 2; p <= k; p++) {
            for (int i = p; i <= n; i++) {
                double best = 0.0;
                for (int j = p-1; j < i; j++) {
                    double val = dp[j,p-1] + (double)(pref[i] - pref[j]) / (i - j);
                    if (val > best) best = val;
                }
                dp[i,p] = best;
            }
        }
        return dp[n,k];
    }
}
