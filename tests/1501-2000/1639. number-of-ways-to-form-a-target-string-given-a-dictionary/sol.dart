class Solution {
  int numWays(List<String> words, String target) {
    const int MOD = 1000000007;
    int m = words[0].length;
    List<List<int>> A = List.generate(m, (_) => List.filled(26, 0));
    for (String word in words) {
      for (int j = 0; j < m; j++) {
        A[j][word.codeUnitAt(j) - 'a'.codeUnitAt(0)]++;
      }
    }
    List<List<int>> dp = List.generate(m, (_) => List.filled(target.length, -1));

    int F(int i, int j) {
      if (j == target.length) return 1;
      if (i == m) return 0;
      if (dp[i][j] != -1) return dp[i][j];
      int count = F(i + 1, j) % MOD;
      count = (count + (A[i][target.codeUnitAt(j) - 'a'.codeUnitAt(0)] * F(i + 1, j + 1)) % MOD) % MOD;
      dp[i][j] = count;
      return count;
    }
    return F(0, 0);
  }
}
