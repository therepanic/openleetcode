class Solution {
  int closedIsland(List<List<int>> grid) {
    int m = grid.length, n = grid[0].length;
    int res = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) continue;
        List<List<int>> stack = [];
        stack.add([i, j]);
        grid[i][j] = 1;
        bool closed = true;
        while (stack.isNotEmpty) {
          List<int> cur = stack.removeLast();
          int r = cur[0], c = cur[1];
          if (r == 0 || c == 0 || r == m - 1 || c == n - 1) {
            closed = false;
          }
          List<List<int>> dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];
          for (var d in dirs) {
            int nr = r + d[0], nc = c + d[1];
            if (nr >= 0 && nr < m && nc >= 0 && nc < n && grid[nr][nc] == 0) {
              grid[nr][nc] = 1;
              stack.add([nr, nc]);
            }
          }
        }
        if (closed) res++;
      }
    }
    return res;
  }
}
