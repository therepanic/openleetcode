class Solution {
  int minimumEffort(List<List<int>> tasks) {
    tasks.sort((a, b) => (b[1] - b[0]).compareTo(a[1] - a[0]));
    bool test(int bal) {
      for (var t in tasks) {
        if (bal < t[1]) return false;
        bal -= t[0];
      }
      return true;
    }
    int lo = 0, hi = 1000000001;
    while (lo < hi) {
      int mid = (lo + hi) ~/ 2;
      if (test(mid)) {
        hi = mid;
      } else {
        lo = mid + 1;
      }
    }
    return lo;
  }
}
