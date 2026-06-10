class Solution {
  int findPeakElement(List<int> nums) {
    final n = nums.length;
    if (n < 3) {
      return nums[0] >= nums[n - 1] ? 0 : n - 1;
    }
    var left = 0;
    var right = n - 1;
    while (left < right) {
      final mid = left + ((right - left) >> 1);
      if (mid > 0 && mid < n - 1 && nums[mid - 1] < nums[mid] && nums[mid] > nums[mid + 1]) {
        return mid;
      }
      if (nums[mid] < nums[mid + 1]) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
}
