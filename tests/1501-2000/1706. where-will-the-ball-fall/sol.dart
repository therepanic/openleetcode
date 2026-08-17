class Solution {
  List<int> findBall(List<List<int>> grid) {
    int m = grid.length, n = grid[0].length;
    List<int> result = List.filled(n, 0);
    for (int col = 0; col < n; col++) {
      int cur = col;
      for (int row = 0; row < m; row++) {
        int d = grid[row][cur];
        int nxt = cur + d;
        if (nxt < 0 || nxt >= n || grid[row][nxt] != d) {
          cur = -1;
          break;
        }
        cur = nxt;
      }
      result[col] = cur;
    }
    return result;
  }
}
