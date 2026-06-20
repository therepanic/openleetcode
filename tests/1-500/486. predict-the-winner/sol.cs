public class Solution {
    public bool PredictTheWinner(int[] nums) {
        int helper(int left, int right) {
            if (left == right) {
                return nums[left];
            }
            return Math.Max(nums[left] - helper(left + 1, right), 
                           nums[right] - helper(left, right - 1));
        }
        return helper(0, nums.Length - 1) >= 0;
    }
}
