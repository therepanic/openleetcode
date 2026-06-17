public class Solution {
    public int LengthOfLIS(int[] nums) {
        int prevIdx = -1;
        int[,] dp = new int[2500, 2500];
        for (int i = 0; i < 2500; i++) {
            for (int j = 0; j < 2500; j++) {
                dp[i, j] = -1;
            }
        }
        return Helper(0, prevIdx, nums, dp);
    }

    private int Helper(int i, int prevIdx, int[] nums, int[,] dp) {
        if (i >= nums.Length) {
            return 0;
        }
        if (dp[i, prevIdx + 1] != -1) {
            return dp[i, prevIdx + 1];
        }
        int steal = 0;
        int skip = 0;
        if (prevIdx == -1 || nums[prevIdx] < nums[i]) {
            steal = 1 + Helper(i + 1, i, nums, dp);
        }
        skip = Helper(i + 1, prevIdx, nums, dp);
        dp[i, prevIdx + 1] = Math.Max(steal, skip);
        return Math.Max(steal, skip);
    }
}
