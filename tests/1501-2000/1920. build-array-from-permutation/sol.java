class Solution {
    public int[] buildArray(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            nums[i] += (1024 * (nums[nums[i]] % 1024));
        }
        
        for (int i = 0; i < nums.length; i++) {
            nums[i] /= 1024;
        }
        
        return nums;
    }
}
