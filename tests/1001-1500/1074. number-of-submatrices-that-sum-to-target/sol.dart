class Solution {
  int numSubmatrixSumTarget(List<List<int>> matrix, int target) {
    int m = matrix.length, n = matrix[0].length;
    for (int row = 0; row < m; row++) {
      for (int col = 1; col < n; col++) {
        matrix[row][col] += matrix[row][col - 1];
      }
    }
    int count = 0;
    for (int c1 = 0; c1 < n; c1++) {
      for (int c2 = c1; c2 < n; c2++) {
        Map<int, int> prefixSumMap = {0: 1};
        int sumVal = 0;
        for (int row = 0; row < m; row++) {
          sumVal += matrix[row][c2] - (c1 > 0 ? matrix[row][c1 - 1] : 0);
          count += prefixSumMap[sumVal - target] ?? 0;
          prefixSumMap[sumVal] = (prefixSumMap[sumVal] ?? 0) + 1;
        }
      }
    }
    return count;
  }
}
