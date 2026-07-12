class Solution {
  List<List<int>> transpose(List<List<int>> matrix) {
    int row = matrix.length;
    int col = matrix[0].length;
    List<List<int>> trans = List.generate(col, (_) => List.filled(row, 0));

    for (int i = 0; i < col; i++) {
      for (int j = 0; j < row; j++) {
        trans[i][j] = matrix[j][i];
      }
    }

    return trans;
  }
}
