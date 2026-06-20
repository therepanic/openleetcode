class Solution {
  int longestIncreasingPath(List<List<int>> matrix) {
    int row = matrix.length;
    int col = matrix[0].length;
    List<List<int>> dp = List.generate(row, (_) => List.filled(col, 0));
    
    int graph(int i, int j) {
      if (dp[i][j] != 0) {
        return dp[i][j];
      }
      
      int top = 0;
      int down = 0;
      int left = 0;
      int right = 0;
      
      if (i - 1 >= 0 && matrix[i-1][j] > matrix[i][j]) {
        if (dp[i-1][j] == 0) {
          dp[i-1][j] = graph(i-1, j);
        }
        top = dp[i-1][j];
      }
      
      if (i + 1 < row && matrix[i+1][j] > matrix[i][j]) {
        if (dp[i+1][j] == 0) {
          dp[i+1][j] = graph(i+1, j);
        }
        down = dp[i+1][j];
      }
      
      if (j - 1 >= 0 && matrix[i][j-1] > matrix[i][j]) {
        if (dp[i][j-1] == 0) {
          dp[i][j-1] = graph(i, j-1);
        }
        left = dp[i][j-1];
      }
      
      if (j + 1 < col && matrix[i][j+1] > matrix[i][j]) {
        if (dp[i][j+1] == 0) {
          dp[i][j+1] = graph(i, j+1);
        }
        right = dp[i][j+1];
      }
      
      dp[i][j] = 1 + [top, down, left, right].reduce((a, b) => a > b ? a : b);
      return dp[i][j];
    }
    
    int maxi = 0;
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        int num = graph(i, j);
        if (num > maxi) {
          maxi = num;
        }
      }
    }
    
    return maxi;
  }
}
