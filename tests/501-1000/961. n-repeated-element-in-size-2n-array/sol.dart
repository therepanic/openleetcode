class Solution {
  int repeatedNTimes(List<int> nums) {
    int n = nums.length - 2;
    for (int i = 0; i < n; i++) {
      if (nums[i] == nums[i + 1] || nums[i] == nums[i + 2]) {
        return nums[i];
      }
    }
    return nums[n + 1];
  }
}
