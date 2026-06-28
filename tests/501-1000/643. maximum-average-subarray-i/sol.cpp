class Solution {
public:
    double findMaxAverage(vector<int>& nums, int k) {
        int windowSum = 0;
        for (int i = 0; i < k; i++) {
            windowSum += nums[i];
        }
        int maxSum = windowSum;
        
        for (int i = k; i < nums.size(); i++) {
            windowSum = windowSum - nums[i - k] + nums[i];
            maxSum = max(maxSum, windowSum);
        }
        
        return (double) maxSum / k;
    }
};
