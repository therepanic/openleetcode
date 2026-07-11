class Solution {
  int minFallingPathSum(List<List<int>> matrix) {
    int m = matrix.length;
    int n = matrix[0].length;
    if (m == 1 && n == 1) {
      int minVal = matrix[0][0];
      for (int v in matrix[0]) {
        if (v < minVal) minVal = v;
      }
      return minVal;
    }
    List<List<int?>> dp = List.generate(m - 1, (_) => List.filled(n, null));
    int mini = 1 << 60;
    int f(int i, int j) {
      if (j >= n || j < 0) return 1 << 60;
      if (i == m - 1) return matrix[i][j];
      if (dp[i][j] != null) return dp[i][j]!;
      int down = matrix[i][j] + f(i + 1, j);
      int leftd = matrix[i][j] + f(i + 1, j - 1);
      int rightd = matrix[i][j] + f(i + 1, j + 1);
      int val = down;
      if (leftd < val) val = leftd;
      if (rightd < val) val = rightd;
      dp[i][j] = val;
      return val;
    }
    for (int i = 0; i < n; i++) {
      int val = f(0, i);
      if (val < mini) mini = val;
    }
    return mini;
  }
}
