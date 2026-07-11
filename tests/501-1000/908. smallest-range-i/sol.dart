class Solution {
  int smallestRangeI(List<int> nums, int k) {
    int minVal = nums[0];
    int maxVal = nums[0];
    
    for (int val in nums) {
      if (val < minVal) {
        minVal = val;
      } else if (val > maxVal) {
        maxVal = val;
      }
    }
    
    int result = maxVal - minVal - k * 2;
    return result < 0 ? 0 : result;
  }
}
