class Solution {
  List<int> searchRange(List<int> nums, int target) {
    int bound(bool left) {
      var low = 0;
      var high = nums.length - 1;
      var ans = -1;

      while (low <= high) {
        final mid = low + (high - low) ~/ 2;
        if (nums[mid] < target) {
          low = mid + 1;
        } else if (nums[mid] > target) {
          high = mid - 1;
        } else {
          ans = mid;
          if (left) {
            high = mid - 1;
          } else {
            low = mid + 1;
          }
        }
      }

      return ans;
    }

    return [bound(true), bound(false)];
  }
}
