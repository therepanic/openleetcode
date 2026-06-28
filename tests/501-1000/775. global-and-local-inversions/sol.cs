public class Solution {
    public bool IsIdealPermutation(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            if (Math.Abs(nums[i] - i) > 1) {
                return false;
            }
        }
        return true;
    }
}
