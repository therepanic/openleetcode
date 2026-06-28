class Solution {
  int smallestDistancePair(List<int> nums, int k) {
    nums.sort();
    int n = nums.length;
    int low = 0;
    int high = nums[n - 1] - nums[0];

    while (low < high) {
      int mid = low + ((high - low) ~/ 2);
      int count = 0;
      int j = 0;
      for (int i = 0; i < n; i++) {
        while (j < n && nums[j] - nums[i] <= mid) {
          j++;
        }
        count += j - i - 1;
      }
      if (count < k) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    return low;
  }
}
