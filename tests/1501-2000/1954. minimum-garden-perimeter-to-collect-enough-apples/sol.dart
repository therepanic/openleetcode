class Solution {
  int minimumPerimeter(int neededApples) {
    var lo = 0, hi = 100000;
    while (lo < hi) {
      var mid = (lo + hi) ~/ 2;
      var apples = 2 * mid * (mid + 1) * (2 * mid + 1);
      if (apples >= neededApples) {
        hi = mid;
      } else {
        lo = mid + 1;
      }
    }
    return lo * 8;
  }
}
