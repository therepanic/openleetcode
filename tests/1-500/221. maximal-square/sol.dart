class Solution {
  int maximalSquare(List<List<String>> matrix) {
    int Rows = matrix.length;
    int Cols = matrix[0].length;
    int maxArea = 0;
    List<List<int>> dp = List.generate(Rows, (_) => List.filled(Cols, 0));

    for (int r = Rows - 1; r >= 0; r--) {
      for (int c = Cols - 1; c >= 0; c--) {
        if (matrix[r][c] == "1") {
          int down = (r + 1 < Rows) ? dp[r + 1][c] : 0;
          int right = (c + 1 < Cols) ? dp[r][c + 1] : 0;
          int diag = (r + 1 < Rows && c + 1 < Cols) ? dp[r + 1][c + 1] : 0;
          dp[r][c] = 1 + [down, right, diag].reduce((a, b) => a < b ? a : b);
        } else {
          dp[r][c] = 0;
        }
        if (dp[r][c] > maxArea) {
          maxArea = dp[r][c];
        }
      }
    }
    return maxArea * maxArea;
  }
}
