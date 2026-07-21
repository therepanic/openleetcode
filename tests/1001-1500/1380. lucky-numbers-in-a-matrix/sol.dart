class Solution {
  List<int> luckyNumbers(List<List<int>> matrix) {
    int rows = matrix.length;
    int cols = matrix[0].length;
    List<int> ans = [];
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        int ele1 = matrix[i][0];
        for (int k = 1; k < cols; k++) {
          if (matrix[i][k] < ele1) ele1 = matrix[i][k];
        }
        int ele2 = matrix[0][j];
        for (int k = 1; k < rows; k++) {
          if (matrix[k][j] > ele2) ele2 = matrix[k][j];
        }
        if (ele1 == matrix[i][j] && ele2 == matrix[i][j]) {
          ans.add(matrix[i][j]);
        }
      }
    }
    return ans;
  }
}
