class Solution {
  int maxProductDifference(List<int> nums) {
    nums.sort();
    final n = nums.length;
    return nums[n - 1] * nums[n - 2] - nums[0] * nums[1];
  }
}
