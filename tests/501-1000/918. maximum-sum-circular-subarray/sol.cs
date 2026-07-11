public class Solution {
    public int MaxSubarraySumCircular(int[] nums) {
        int maxSum = nums[0];
        int minSum = nums[0];
        int currMaxSum = nums[0];
        int currMinSum = nums[0];
        int totalSum = nums[0];
        
        for (int i = 1; i < nums.Length; i++) {
            currMaxSum = Math.Max(currMaxSum + nums[i], nums[i]);
            maxSum = Math.Max(maxSum, currMaxSum);
            
            currMinSum = Math.Min(currMinSum + nums[i], nums[i]);
            minSum = Math.Min(minSum, currMinSum);
            
            totalSum += nums[i];
        }
        
        int circularSum = totalSum - minSum;
        
        if (circularSum == 0) {
            return maxSum;
        }
        
        return Math.Max(maxSum, circularSum);
    }
}
