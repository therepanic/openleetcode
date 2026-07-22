class Solution {
    public int maxSumDivThree(int[] nums) {
        int n = nums.length;
        int minus = -(1 << 30);
        int[][] dp = new int[][] {{0, 0, 0}, {0, minus, minus}};
        for (int i = 0; i < n; i++) {
            int x = nums[i];
            int x3 = x % 3;
            for (int mod = 0; mod < 3; mod++) {
                int modPrev = (3 + mod - x3) % 3;
                int take = x + dp[(i + 1) & 1][modPrev];
                int skip = dp[(i + 1) & 1][mod];
                dp[i & 1][mod] = Math.max(take, skip);
            }
        }
        return Math.max(0, dp[(n - 1) & 1][0]);
    }
}
