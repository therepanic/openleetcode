class Solution {
  List<int> findDiagonalOrder(List<List<int>> mat) {
    if (mat.isEmpty || mat[0].isEmpty) {
      return [];
    }
    
    int m = mat.length, n = mat[0].length;
    List<int> result = [];
    int row = 0, col = 0;
    
    for (int i = 0; i < m * n; i++) {
      result.add(mat[row][col]);
      
      if ((row + col) % 2 == 0) {
        if (col == n - 1) {
          row++;
        } else if (row == 0) {
          col++;
        } else {
          row--;
          col++;
        }
      } else {
        if (row == m - 1) {
          col++;
        } else if (col == 0) {
          row++;
        } else {
          row++;
          col--;
        }
      }
    }
    
    return result;
  }
}
