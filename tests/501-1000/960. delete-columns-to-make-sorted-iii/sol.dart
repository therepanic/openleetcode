class Solution {
  int minDeletionSize(List<String> strs) {
    int m = strs[0].length;
    List<int> dp = List.filled(m, 1);
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < i; j++) {
        bool all = true;
        for (var row in strs) {
          if (row[j].compareTo(row[i]) > 0) {
            all = false;
            break;
          }
        }
        if (all && dp[j] + 1 > dp[i]) {
          dp[i] = dp[j] + 1;
        }
      }
    }
    
    int maxDp = dp.reduce((a, b) => a > b ? a : b);
    return m - maxDp;
  }
}
