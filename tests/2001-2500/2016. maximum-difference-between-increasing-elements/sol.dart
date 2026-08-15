class Solution {
  int maximumDifference(List<int> nums) {
    int minVal = nums[0];
    int maxDiff = -1;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > minVal) {
        maxDiff = maxDiff > nums[i] - minVal ? maxDiff : nums[i] - minVal;
      } else {
        minVal = nums[i];
      }
    }
    return maxDiff;
  }
}
