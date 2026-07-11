class Solution {
public:
    int maxSubarraySumCircular(vector<int>& nums) {
        int maxSum = nums[0];
        int minSum = nums[0];
        int currMaxSum = nums[0];
        int currMinSum = nums[0];
        int totalSum = nums[0];
        
        for (int i = 1; i < nums.size(); i++) {
            currMaxSum = max(currMaxSum + nums[i], nums[i]);
            maxSum = max(maxSum, currMaxSum);
            
            currMinSum = min(currMinSum + nums[i], nums[i]);
            minSum = min(minSum, currMinSum);
            
            totalSum += nums[i];
        }
        
        int circularSum = totalSum - minSum;
        
        if (circularSum == 0) {
            return maxSum;
        }
        
        return max(maxSum, circularSum);
    }
};
