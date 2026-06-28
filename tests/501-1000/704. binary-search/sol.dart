class Solution {
  int search(List<int> nums, int target) {
    int low = 0;
    int high = nums.length - 1;

    while (low <= high) {
      int mid = ((low + high) / 2).floor();
      if (nums[mid] == target) {
        return mid;
      } else if (nums[mid] < target) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    return -1;
  }
}
