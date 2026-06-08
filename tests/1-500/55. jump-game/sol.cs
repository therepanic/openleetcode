public class Solution {
    public bool CanJump(int[] nums) {
        int farthest = 0;
        for (int i = 0; i < nums.Length; i++) {
            if (i > farthest) {
                return false;
            }
            farthest = Math.Max(farthest, i + nums[i]);
            if (farthest >= nums.Length - 1) {
                return true;
            }
        }
        return true;
    }
}
