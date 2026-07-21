class Solution {
  int longestCommonSubsequence(String text1, String text2) {
    int m = text1.length;
    int n = text2.length;
    List<List<int>> memo = List.generate(m, (_) => List.filled(n, -1));

    int solve(int i, int j) {
      if (i >= m || j >= n) return 0;
      if (memo[i][j] != -1) return memo[i][j];

      if (text1[i] == text2[j]) {
        memo[i][j] = 1 + solve(i + 1, j + 1);
      } else {
        memo[i][j] = max(solve(i + 1, j), solve(i, j + 1));
      }
      return memo[i][j];
    }

    return solve(0, 0);
  }

  int max(int a, int b) => a > b ? a : b;
}
