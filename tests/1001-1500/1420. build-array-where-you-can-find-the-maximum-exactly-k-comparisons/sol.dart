class Solution {
  static const int MOD = 1000000007;
  late List<List<List<int>>> dp;
  late int n, m, k;

  int numOfArrays(int n, int m, int k) {
    this.n = n;
    this.m = m;
    this.k = k;
    dp = List.generate(n + 1, (_) => List.generate(k + 1, (_) => List.filled(m + 1, -1)));
    return solve(0, 0, 0);
  }

  int solve(int idx, int searchCost, int maxValue) {
    if (idx == n) return searchCost == k ? 1 : 0;
    if (searchCost > k) return 0;
    if (dp[idx][searchCost][maxValue] != -1) return dp[idx][searchCost][maxValue];

    int result = 0;
    for (int i = 1; i <= m; i++) {
      if (i > maxValue) {
        result = (result + solve(idx + 1, searchCost + 1, i)) % MOD;
      } else {
        result = (result + solve(idx + 1, searchCost, maxValue)) % MOD;
      }
    }

    dp[idx][searchCost][maxValue] = result;
    return result;
  }
}
