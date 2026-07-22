class Solution {
  int countServers(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    List<int> rowCounts = List.filled(m, 0);
    List<int> colCounts = List.filled(n, 0);
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          rowCounts[i]++;
          colCounts[j]++;
        }
      }
    }
    int result = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1 && (rowCounts[i] > 1 || colCounts[j] > 1)) {
          result++;
        }
      }
    }
    return result;
  }
}
