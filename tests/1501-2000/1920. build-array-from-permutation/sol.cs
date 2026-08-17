public class Solution {
    public int[] BuildArray(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            nums[i] += (1024 * (nums[nums[i]] % 1024));
        }
        
        for (int i = 0; i < nums.Length; i++) {
            nums[i] /= 1024;
        }
        
        return nums;
    }
}
