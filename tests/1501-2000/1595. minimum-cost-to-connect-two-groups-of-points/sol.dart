class Solution {
  int connectTwoGroups(List<List<int>> cost) {
    int m = cost.length;
    int n = cost[0].length;
    List<int> mn = List.generate(n, (j) {
      int minVal = cost[0][j];
      for (int i = 1; i < m; i++) {
        if (cost[i][j] < minVal) minVal = cost[i][j];
      }
      return minVal;
    });
    List<List<int>> memo = List.generate(m+1, (_) => List.filled(1<<n, -1));
    int fn(int i, int mask) {
      if (memo[i][mask] != -1) return memo[i][mask];
      if (i == m) {
        int sum = 0;
        for (int j = 0; j < n; j++) {
          if ((mask & (1<<j)) == 0) sum += mn[j];
        }
        memo[i][mask] = sum;
      } else {
        int best = 1 << 30;
        for (int j = 0; j < n; j++) {
          best = min(best, cost[i][j] + fn(i+1, mask | (1<<j)));
        }
        memo[i][mask] = best;
      }
      return memo[i][mask];
    }
    return fn(0, 0);
  }
}
