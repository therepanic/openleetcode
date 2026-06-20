class Solution {
  int numSquares(int n) {
    var dp = List.filled(n + 1, double.infinity);
    dp[0] = 0;

    for (int i = 1; i <= n; i++) {
      int j = 1;
      while (j * j <= i) {
        dp[i] = (dp[i] < dp[i - j * j] + 1) ? dp[i] : (dp[i - j * j] + 1).toDouble();
        j++;
      }
    }

    return dp[n].toInt();
  }
}
