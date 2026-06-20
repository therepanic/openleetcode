class Solution {
    public int maximumGap(int[] nums) {
        if (nums.length < 2) return 0;
        java.util.Arrays.sort(nums);
        int best = 0;
        for (int i = 1; i < nums.length; i++) {
            best = Math.max(best, nums[i] - nums[i - 1]);
        }
        return best;
    }
}
