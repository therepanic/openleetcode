class Solution {
  double findMaxAverage(List<int> nums, int k) {
    int windowSum = nums.sublist(0, k).fold(0, (a, b) => a + b);
    int maxSum = windowSum;
    
    for (int i = k; i < nums.length; i++) {
      windowSum = windowSum - nums[i - k] + nums[i];
      if (windowSum > maxSum) {
        maxSum = windowSum;
      }
    }
    
    return maxSum / k;
  }
}
