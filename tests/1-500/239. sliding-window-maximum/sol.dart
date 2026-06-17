class Solution {
  List<int> maxSlidingWindow(List<int> nums, int k) {
    List<int> res = [];
    List<int> q = [];
    for (int idx = 0; idx < nums.length; idx++) {
      int num = nums[idx];
      while (q.isNotEmpty && q.last < num) {
        q.removeLast();
      }
      q.add(num);
      if (idx >= k && nums[idx - k] == q.first) {
        q.removeAt(0);
      }
      if (idx >= k - 1) {
        res.add(q.first);
      }
    }
    return res;
  }
}
