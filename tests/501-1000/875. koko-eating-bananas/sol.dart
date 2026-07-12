class Solution {
  int minEatingSpeed(List<int> piles, int h) {
    bool canFinish(int k) {
      int hours = 0;
      for (int pile in piles) {
        hours += pile ~/ k;
        if (pile % k != 0) {
          hours++;
        }
        if (hours > h) {
          return false;
        }
      }
      return true;
    }

    int left = 1;
    int right = piles.reduce((a, b) => a > b ? a : b);
    int ans = right;
    while (left <= right) {
      int mid = left + (right - left) ~/ 2;
      if (canFinish(mid)) {
        ans = mid;
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }
    return ans;
  }
}
