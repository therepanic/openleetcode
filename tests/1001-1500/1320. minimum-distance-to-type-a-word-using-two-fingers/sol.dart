class Solution {
  int _cal(int a, int b) {
    return (a ~/ 6 - b ~/ 6).abs() + (a % 6 - b % 6).abs();
  }

  int minimumDistance(String word) {
    int n = word.length;
    List<int> dp = List.filled(26, 0);
    List<int> ndp = List.filled(26, 0);

    for (int i = 1; i < n; i++) {
      int p = word.codeUnitAt(i - 1) - 'A'.codeUnitAt(0);
      int t = word.codeUnitAt(i) - 'A'.codeUnitAt(0);

      for (int j = 0; j < 26; j++) {
        ndp[j] = dp[j] + _cal(p, t);
      }

      for (int j = 0; j < 26; j++) {
        ndp[p] = [ndp[p], dp[j] + _cal(j, t)].reduce((a, b) => a < b ? a : b);
      }

      var temp = dp;
      dp = ndp;
      ndp = temp;
    }

    return dp.reduce((a, b) => a < b ? a : b);
  }
}
