public class Solution {
    public int FindTargetSumWays(int[] nums, int target) {
        int total = 0;
        foreach (int num in nums) total += num;
        if (Math.Abs(target) > total || (target + total) % 2 != 0) return 0;
        int sum = (target + total) / 2;
        int[] dp = new int[sum + 1];
        dp[0] = 1;

        foreach (int num in nums) {
            for (int j = sum; j >= num; j--) {
                dp[j] += dp[j - num];
            }
        }

        return dp[sum];
    }
}
