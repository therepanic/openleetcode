class Solution {
  int minimumBoxes(int n) {
    int lo = 0, hi = 200000;
    while (lo < hi) {
      final mid = (lo + hi + 1) ~/ 2;
      if (mid * (mid + 1) * (mid + 2) ~/ 6 <= n) lo = mid;
      else hi = mid - 1;
    }
    final remaining = n - lo * (lo + 1) * (lo + 2) ~/ 6;
    var extra = 0;
    while (extra * (extra + 1) ~/ 2 < remaining) extra++;
    return lo * (lo + 1) ~/ 2 + extra;
  }
}
