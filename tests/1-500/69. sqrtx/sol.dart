class Solution {
  int mySqrt(int x) {
    if (x < 2) {
      return x;
    }

    var left = 1;
    var right = x ~/ 2;
    var ans = 1;
    while (left <= right) {
      final mid = left + ((right - left) ~/ 2);
      if (mid <= x ~/ mid) {
        ans = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return ans;
  }
}
