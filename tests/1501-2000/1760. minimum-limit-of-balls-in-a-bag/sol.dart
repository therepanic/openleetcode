class Solution {
  int minimumSize(List<int> nums, int maxOperations) {
    int lo = 1, hi = nums.reduce((a, b) => a > b ? a : b);
    while (lo < hi) {
      int mid = (lo + hi) ~/ 2;
      int needed = 0;
      for (int x in nums) {
        needed += (x - 1) ~/ mid;
      }
      if (needed <= maxOperations) {
        hi = mid;
      } else {
        lo = mid + 1;
      }
    }
    return lo;
  }
}
