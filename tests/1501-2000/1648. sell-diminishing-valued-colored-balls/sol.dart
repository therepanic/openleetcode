class Solution {
  int maxProfit(List<int> inventory, int orders) {
    int max = inventory.reduce((a, b) => a > b ? a : b);
    int t = binarySearch(inventory, 0, max, orders);
    int total = 0;
    int sold = 0;
    for (int ball in inventory) {
      if (ball > t) {
        int cnt = ball - t;
        total += (ball + t + 1) * cnt ~/ 2;
        sold += cnt;
      }
    }
    int extra = sold - orders;
    int res = total - extra * (t + 1);
    return res % 1000000007;
  }

  int binarySearch(List<int> arr, int left, int right, int target) {
    while (left < right) {
      int mid = (left + right + 1) ~/ 2;
      int count = 0;
      for (int x in arr) {
        if (x > mid) count += x - mid;
      }
      if (count >= target) {
        left = mid;
      } else {
        right = mid - 1;
      }
    }
    return left;
  }
}
