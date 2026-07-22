class Solution {
  int minFallingPathSum(List<List<int>> grid) {
    int n = grid.length;
    List<int> dp = List<int>.from(grid[0]);
    for (int i = 1; i < n; i++) {
      int smallest = 1 << 62;
      int secondSmallest = 1 << 62;
      int smallestCol = -1;
      for (int col = 0; col < n; col++) {
        int value = dp[col];
        if (value < smallest) {
          secondSmallest = smallest;
          smallest = value;
          smallestCol = col;
        } else if (value < secondSmallest) {
          secondSmallest = value;
        }
      }
      dp = List<int>.generate(n, (col) {
        return grid[i][col] + (col == smallestCol ? secondSmallest : smallest);
      });
    }
    return dp.reduce((a, b) => a < b ? a : b);
  }
}
