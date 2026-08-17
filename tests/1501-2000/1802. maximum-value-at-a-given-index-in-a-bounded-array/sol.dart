class Solution {
  int maxValue(int n, int index, int maxSum) {
    int l = 0, r = maxSum, result = 1;
    while (l <= r) {
      int mid = (l + r) ~/ 2;
      if (isValid(mid, n, index, maxSum)) {
        result = mid;
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }
    return result;
  }

  bool isValid(int mid, int n, int index, int maxSum) {
    int leftCount = index;
    int left;
    if (mid > leftCount) {
      left = (mid - leftCount + mid - 1) * leftCount ~/ 2;
    } else {
      int ones = leftCount - (mid - 1);
      left = mid * (mid - 1) ~/ 2 + ones;
    }

    int rightCount = n - index - 1;
    int right;
    if (mid > rightCount) {
      right = (mid - 1 + mid - rightCount) * rightCount ~/ 2;
    } else {
      int ones = rightCount - (mid - 1);
      right = mid * (mid - 1) ~/ 2 + ones;
    }

    return left + mid + right <= maxSum;
  }
}
