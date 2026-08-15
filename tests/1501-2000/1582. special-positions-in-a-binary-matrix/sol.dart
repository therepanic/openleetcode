class Solution {
  int numSpecial(List<List<int>> mat) {
    int m = mat.length, n = mat[0].length;
    List<int> row = List.filled(m, 0);
    List<int> col = List.filled(n, 0);

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 1) {
          row[i]++;
          col[j]++;
        }
      }
    }

    int result = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 1 && row[i] == 1 && col[j] == 1) {
          result++;
        }
      }
    }
    return result;
  }
}
