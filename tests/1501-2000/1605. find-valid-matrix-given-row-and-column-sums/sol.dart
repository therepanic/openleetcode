class Solution {
  List<List<int>> restoreMatrix(List<int> rowSum, List<int> colSum) {
    int m = rowSum.length, n = colSum.length;
    List<List<int>> matrix = List.generate(m, (_) => List.filled(n, 0));
    int i = 0, j = 0;
    while (i < m && j < n) {
      int val = rowSum[i] < colSum[j] ? rowSum[i] : colSum[j];
      matrix[i][j] = val;
      rowSum[i] -= val;
      colSum[j] -= val;
      if (rowSum[i] == 0) i++;
      if (colSum[j] == 0) j++;
    }
    return matrix;
  }
}
