class Solution {
  bool isPerfectSquare(int num) {
    if (num < 2) {
      return true;
    }

    int left = 2;
    int right = num ~/ 2;
    while (left <= right) {
      int mid = left + (right - left) ~/ 2;
      int squared = mid * mid;
      if (squared == num) {
        return true;
      } else if (squared < num) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return false;
  }
}
