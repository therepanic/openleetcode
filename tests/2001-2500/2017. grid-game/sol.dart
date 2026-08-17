class Solution {
  int gridGame(List<List<int>> grid) {
    int minResult = 1 << 60;
    int row1Sum = grid[0].fold(0, (a, b) => a + b);
    int row2Sum = 0;
    
    for (int i = 0; i < grid[0].length; i++) {
      row1Sum -= grid[0][i];
      int currentMax = row1Sum > row2Sum ? row1Sum : row2Sum;
      if (currentMax < minResult) {
        minResult = currentMax;
      }
      row2Sum += grid[1][i];
    }
    
    return minResult;
  }
}
