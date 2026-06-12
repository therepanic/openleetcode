class Solution {
  int maxProfit(int k, List<int> prices) {
    final n = prices.length;
    if (k == 0 || n < 2) return 0;
    if (k >= n ~/ 2) {
      var ans = 0;
      for (int i = 1; i < n; i++) {
        if (prices[i] > prices[i - 1]) ans += prices[i] - prices[i - 1];
      }
      return ans;
    }

    final hold = List<int>.filled(k + 1, -(1 << 60));
    final free = List<int>.filled(k + 1, 0);
    for (final price in prices) {
      for (int t = 1; t <= k; t++) {
        if (free[t - 1] - price > hold[t]) hold[t] = free[t - 1] - price;
        if (hold[t] + price > free[t]) free[t] = hold[t] + price;
      }
    }
    return free.reduce((a, b) => a > b ? a : b);
  }
}
