class Solution {
  int getMaximumGold(List<List<int>> grid) {
    int n = grid.length;
    int m = grid[0].length;
    
    List<List<bool>> visited = List.generate(n, (_) => List.filled(m, false));
    List<List<int>> directions = [[-1, 0], [0, 1], [1, 0], [0, -1]];
    
    int dfs(int r, int c) {
      int total = grid[r][c];
      visited[r][c] = true;
      
      int curr = 0;
      for (var dir in directions) {
        int nr = r + dir[0];
        int nc = c + dir[1];
        if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
          if (grid[nr][nc] != 0 && !visited[nr][nc]) {
            int a = dfs(nr, nc);
            if (a > curr) curr = a;
          }
        }
      }
      total += curr;
      visited[r][c] = false;
      return total;
    }
    
    int ans = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (!visited[i][j] && grid[i][j] != 0) {
          int res = dfs(i, j);
          if (res > ans) ans = res;
        }
      }
    }
    return ans;
  }
}
