class Solution {
    private int[][] memo;
    private int[] nums1;
    private int[] nums2;
    
    public int maxDotProduct(int[] nums1, int[] nums2) {
        this.nums1 = nums1;
        this.nums2 = nums2;
        memo = new int[nums1.length][nums2.length];
        for (int i = 0; i < nums1.length; i++) {
            java.util.Arrays.fill(memo[i], Integer.MIN_VALUE);
        }
        return dp(0, 0);
    }
    
    private int dp(int i, int j) {
        if (i == nums1.length || j == nums2.length) {
            return Integer.MIN_VALUE;
        }
        if (memo[i][j] != Integer.MIN_VALUE) {
            return memo[i][j];
        }
        
        int take = nums1[i] * nums2[j];
        int takeAndContinue = dp(i+1, j+1);
        int res;
        if (takeAndContinue == Integer.MIN_VALUE) {
            res = take;
        } else {
            res = take + takeAndContinue;
        }
        res = Math.max(res, take);
        res = Math.max(res, dp(i+1, j));
        res = Math.max(res, dp(i, j+1));
        
        memo[i][j] = res;
        return res;
    }
}
