class Solution {
  int pivotIndex(List<int> nums) {
    int totalSum = nums.reduce((a, b) => a + b);
    int lSum = 0;
    int rSum = totalSum;
    for (int i = 0; i < nums.length; i++) {
      rSum -= nums[i];
      if (lSum == rSum) {
        return i;
      }
      lSum += nums[i];
    }
    return -1;
  }
}
