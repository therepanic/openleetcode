class Solution {
  int searchInsert(List<int> nums, int target) {
    var low = 0;
    var high = nums.length - 1;

    while (low <= high) {
      final mid = low + (high - low) ~/ 2;
      if (nums[mid] < target) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    return low;
  }
}
