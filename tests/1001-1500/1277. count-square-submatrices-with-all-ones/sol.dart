class Solution {
  int countSquares(List<List<int>> matrix) {
    if (matrix.isEmpty || matrix[0].isEmpty) {
      return 0;
    }
    
    int m = matrix.length;
    int n = matrix[0].length;
    int res = 0;
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (matrix[i][j] == 1 && i > 0 && j > 0) {
          matrix[i][j] = [
            matrix[i-1][j],
            matrix[i][j-1],
            matrix[i-1][j-1]
          ].reduce((a, b) => a < b ? a : b) + 1;
        }
        res += matrix[i][j];
      }
    }
    
    return res;
  }
}
