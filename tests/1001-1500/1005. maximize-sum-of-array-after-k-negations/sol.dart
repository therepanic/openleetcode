class Solution {
  int largestSumAfterKNegations(List<int> nums, int k) {
    nums.sort();
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] < 0 && k > 0) {
        nums[i] = -nums[i];
        k--;
      }
    }
    nums.sort();
    if (k > 0 && k % 2 != 0) {
      nums[0] = -nums[0];
    }
    return nums.reduce((a, b) => a + b);
  }
}
