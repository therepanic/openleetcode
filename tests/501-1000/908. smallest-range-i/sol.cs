public class Solution {
    public int SmallestRangeI(int[] nums, int k) {
        int minVal = nums[0];
        int maxVal = nums[0];
        
        foreach (int val in nums) {
            if (val < minVal) {
                minVal = val;
            } else if (val > maxVal) {
                maxVal = val;
            }
        }
        
        return Math.Max(0, maxVal - minVal - k * 2);
    }
}
