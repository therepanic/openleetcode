class Solution {
    public int smallestRangeI(int[] nums, int k) {
        int min_val = nums[0];
        int max_val = nums[0];
        
        for (int val : nums) {
            if (val < min_val) {
                min_val = val;
            } else if (val > max_val) {
                max_val = val;
            }
        }
        
        return Math.max(0, max_val - min_val - k * 2);
    }
}
