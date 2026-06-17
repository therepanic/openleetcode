class Solution {
  List<int> countSmaller(List<int> nums) {
    final idxs = List.generate(nums.length, (i) => i);
    final ans = List<int>.filled(nums.length, 0);
    final tmp = List<int>.filled(nums.length, 0);

    void sortCount(int lo, int hi) {
      if (hi - lo <= 1) return;
      final mid = (lo + hi) >> 1;
      sortCount(lo, mid);
      sortCount(mid, hi);
      var i = lo;
      var j = mid;
      var p = lo;
      var rightMoved = 0;
      while (i < mid || j < hi) {
        if (j == hi || (i < mid && nums[idxs[i]] <= nums[idxs[j]])) {
          ans[idxs[i]] += rightMoved;
          tmp[p++] = idxs[i++];
        } else {
          rightMoved++;
          tmp[p++] = idxs[j++];
        }
      }
      for (var t = lo; t < hi; t++) {
        idxs[t] = tmp[t];
      }
    }

    sortCount(0, nums.length);
    return ans;
  }
}
