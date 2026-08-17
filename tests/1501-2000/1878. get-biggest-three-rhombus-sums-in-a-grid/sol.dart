class Solution {
  List<int> getBiggestThree(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    int maxD = (m < n ? m : n) ~/ 2;
    List<int> result = [];
    for (int d = 0; d <= maxD; d++) {
      for (int i = d; i < m - d; i++) {
        for (int j = d; j < n - d; j++) {
          int val = diamondSum(grid, i, j, d);
          if (!result.contains(val)) {
            result.add(val);
          }
        }
      }
    }
    result.sort((a, b) => b.compareTo(a));
    return result.length < 3 ? result : result.sublist(0, 3);
  }
  
  int diamondSum(List<List<int>> grid, int i, int j, int d) {
    if (d == 0) return grid[i][j];
    int sum = 0;
    for (int t = 0; t <= d; t++) sum += grid[i - d + t][j + t];
    for (int t = 1; t <= d; t++) sum += grid[i + t][j + d - t];
    for (int t = 1; t <= d; t++) sum += grid[i + d - t][j - t];
    for (int t = 1; t < d; t++) sum += grid[i - t][j - d + t];
    return sum;
  }
}
