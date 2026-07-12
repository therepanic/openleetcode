class Solution {
  int mergeStones(List<int> stones, int k) {
    int n = stones.length;
    if ((n - 1) % (k - 1) != 0) return -1;
    
    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 1; i <= n; i++) {
      prefix[i] = prefix[i-1] + stones[i-1];
    }
    
    List<List<List<int>>> dp = List.generate(
      n, 
      (_) => List.generate(
        n, 
        (_) => List.filled(k + 1, 1 << 31 - 1)
      )
    );
    
    for (int i = 0; i < n; i++) {
      dp[i][i][1] = 0;
    }
    
    for (int len = 2; len <= n; len++) {
      for (int i = 0; i + len - 1 < n; i++) {
        int j = i + len - 1;
        for (int p = 2; p <= k; p++) {
          for (int m = i; m < j; m += k - 1) {
            if (dp[i][m][1] != 1 << 31 - 1 && dp[m+1][j][p-1] != 1 << 31 - 1) {
              int val = dp[i][m][1] + dp[m+1][j][p-1];
              if (val < dp[i][j][p]) {
                dp[i][j][p] = val;
              }
            }
          }
        }
        if (dp[i][j][k] != 1 << 31 - 1) {
          dp[i][j][1] = dp[i][j][k] + (prefix[j+1] - prefix[i]);
        }
      }
    }
    
    return dp[0][n-1][1] == 1 << 31 - 1 ? -1 : dp[0][n-1][1];
  }
}
