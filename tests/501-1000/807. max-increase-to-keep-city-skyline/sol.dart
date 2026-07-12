class Solution {
  int maxIncreaseKeepingSkyline(List<List<int>> grid) {
    int n = grid.length;
    List<int> rowMax = List<int>.generate(n, (r) => grid[r].reduce((a, b) => a > b ? a : b));
    List<int> colMax = List<int>.generate(n, (c) {
      int maxVal = 0;
      for (int r = 0; r < n; r++) {
        if (grid[r][c] > maxVal) maxVal = grid[r][c];
      }
      return maxVal;
    });
    int gain = 0;
    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        int minVal = rowMax[r] < colMax[c] ? rowMax[r] : colMax[c];
        gain += minVal - grid[r][c];
      }
    }
    return gain;
  }
}
