class Solution {
  int search(List<int> nums, int target) {
    var low = 0;
    var high = nums.length - 1;

    while (low <= high) {
      final mid = low + (high - low) ~/ 2;

      if (nums[mid] == target) {
        return mid;
      }

      if (nums[low] <= nums[mid]) {
        if (nums[low] <= target && target < nums[mid]) {
          high = mid - 1;
        } else {
          low = mid + 1;
        }
      } else {
        if (nums[mid] < target && target <= nums[high]) {
          low = mid + 1;
        } else {
          high = mid - 1;
        }
      }
    }

    return -1;
  }
}
