class Solution {
  int numFactoredBinaryTrees(List<int> arr) {
    const int MOD = 1000000007;
    arr.sort();
    Map<int, int> dp = {};
    Set<int> s = arr.toSet();
    for (int x in arr) {
      dp[x] = 1;
      for (int a in arr) {
        if (a > x) break;
        if (x % a == 0) {
          int b = x ~/ a;
          if (s.contains(b)) {
            dp[x] = (dp[x]! + dp[a]! * dp[b]!) % MOD;
          }
        }
      }
    }
    int sum = 0;
    for (int v in dp.values) {
      sum = (sum + v) % MOD;
    }
    return sum;
  }
}
