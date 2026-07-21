class Solution {
  int minDistance(List<int> houses, int k) {
    int n = houses.length;
    houses.sort();
    List<int> P = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      P[i + 1] = P[i] + houses[i];
    }
    
    List<List<int>> G = List.generate(n, (_) => List.filled(n, 0));
    for (int i = 0; i < n; i++) {
      for (int j = i; j < n; j++) {
        int mid = (i + j) ~/ 2;
        int countLeft = mid - i + 1;
        int countRight = j - mid;
        int sumLeft = P[mid + 1] - P[i];
        int sumRight = P[j + 1] - P[mid + 1];
        G[i][j] = (houses[mid] * countLeft - sumLeft) + (sumRight - houses[mid] * countRight);
      }
    }
    
    List<List<int>> dp = List.generate(k + 1, (_) => List.filled(n + 1, 1 << 30));
    dp[0][0] = 0;
    
    for (int m = 1; m <= k; m++) {
      for (int j = 1; j <= n; j++) {
        int best = 1 << 30;
        for (int i = 0; i < j; i++) {
          int cand = dp[m-1][i] + G[i][j-1];
          if (cand < best) best = cand;
        }
        dp[m][j] = best;
      }
    }
    
    return dp[k][n];
  }
}
