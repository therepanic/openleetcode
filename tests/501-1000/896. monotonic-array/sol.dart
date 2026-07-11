class Solution {
  bool isMonotonic(List<int> nums) {
    int n = nums.length;
    if (nums[0] < nums[n - 1]) {
      for (int i = 1; i < n; i++) {
        if (nums[i] < nums[i - 1]) {
          return false;
        }
      }
    } else {
      for (int i = 1; i < n; i++) {
        if (nums[i] > nums[i - 1]) {
          return false;
        }
      }
    }
    return true;
  }
}
