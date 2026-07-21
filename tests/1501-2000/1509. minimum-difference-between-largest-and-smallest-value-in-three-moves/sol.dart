class Solution {
  int minDifference(List<int> nums) {
    if (nums.length <= 3) {
      return 0;
    }
    nums.sort();
    int n = nums.length;
    return [
      nums[n-4] - nums[0],
      nums[n-3] - nums[1],
      nums[n-2] - nums[2],
      nums[n-1] - nums[3]
    ].reduce((a, b) => a < b ? a : b);
  }
}
