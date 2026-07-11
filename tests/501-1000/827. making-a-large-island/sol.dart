class Solution {
  int largestIsland(List<List<int>> grid) {
    int r = grid.length;
    int c = grid[0].length;
    List<List<int>> dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]];
    int island = 2;
    Map<int, int> a = {};
    
    int dfs(int i, int j, int x) {
      int tot = 1;
      grid[i][j] = x;
      for (var d in dirs) {
        int nx = i + d[0];
        int ny = j + d[1];
        if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] == 1) {
          tot += dfs(nx, ny, x);
        }
      }
      return tot;
    }
    
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        if (grid[i][j] == 1) {
          a[island] = dfs(i, j, island);
          island++;
        }
      }
    }
    
    int res = 0;
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        if (grid[i][j] == 0) {
          Set<int> y = {};
          for (var d in dirs) {
            int nx = i + d[0];
            int ny = j + d[1];
            if (nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] != 0) {
              y.add(grid[nx][ny]);
            }
          }
          int tot = 1;
          for (int b in y) {
            tot += a[b] ?? 0;
          }
          res = res > tot ? res : tot;
        }
      }
    }
    
    return res > (a[2] ?? 0) ? res : (a[2] ?? 0);
  }
}
