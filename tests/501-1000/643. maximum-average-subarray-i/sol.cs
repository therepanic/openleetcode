public class Solution {
    public double FindMaxAverage(int[] nums, int k) {
        int windowSum = 0;
        for (int i = 0; i < k; i++) {
            windowSum += nums[i];
        }
        int maxSum = windowSum;
        
        for (int i = k; i < nums.Length; i++) {
            windowSum = windowSum - nums[i - k] + nums[i];
            maxSum = Math.Max(maxSum, windowSum);
        }
        
        return (double) maxSum / k;
    }
}
