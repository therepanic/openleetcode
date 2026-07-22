class Solution {
  int longestSubarray(List<int> nums, int limit) {
    final maxq = Queue<int>();
    final minq = Queue<int>();
    int left = 0;
    int max_len = 1;
    for (int right = 0; right < nums.length; right++) {
      while (maxq.isNotEmpty && nums[maxq.last] <= nums[right]) {
        maxq.removeLast();
      }
      maxq.addLast(right);
      while (minq.isNotEmpty && nums[minq.last] >= nums[right]) {
        minq.removeLast();
      }
      minq.addLast(right);
      while (nums[maxq.first] - nums[minq.first] > limit) {
        left++;
        if (maxq.first < left) {
          maxq.removeFirst();
        }
        if (minq.first < left) {
          minq.removeFirst();
        }
      }
      max_len = max(max_len, right - left + 1);
    }
    return max_len;
  }
}
