public class Solution {
    public int MaximumDifference(int[] nums) {
        int minVal = nums[0];
        int maxDiff = -1;
        for (int i = 1; i < nums.Length; i++) {
            if (nums[i] > minVal) {
                maxDiff = Math.Max(maxDiff, nums[i] - minVal);
            } else {
                minVal = nums[i];
            }
        }
        return maxDiff;
    }
}
