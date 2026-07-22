class Solution {
  int countOrders(int n) {
    const MOD = 1000000007;
    int count = 1;
    for (int i = 2; i <= n; i++) {
      count = (count * (2 * i - 1) * i) % MOD;
    }
    return count;
  }
}
