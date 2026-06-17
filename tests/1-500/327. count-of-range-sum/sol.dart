class Solution {
  int countRangeSum(List<int> nums, int lower, int upper) {
    final sums = List<int>.filled(nums.length + 1, 0);
    for (var i = 0; i < nums.length; i++) {
      sums[i + 1] = sums[i] + nums[i];
    }
    final tmp = List<int>.filled(sums.length, 0);

    int sortCount(int lo, int hi) {
      if (hi - lo <= 1) return 0;
      final mid = (lo + hi) >> 1;
      var count = sortCount(lo, mid) + sortCount(mid, hi);
      var r = mid;
      var k = mid;
      for (var i = lo; i < mid; i++) {
        while (r < hi && sums[r] - sums[i] < lower) r++;
        while (k < hi && sums[k] - sums[i] <= upper) k++;
        count += k - r;
      }
      var i = lo;
      var j = mid;
      var p = lo;
      while (i < mid || j < hi) {
        if (j == hi || (i < mid && sums[i] <= sums[j])) {
          tmp[p++] = sums[i++];
        } else {
          tmp[p++] = sums[j++];
        }
      }
      for (var t = lo; t < hi; t++) {
        sums[t] = tmp[t];
      }
      return count;
    }

    return sortCount(0, sums.length);
  }
}
