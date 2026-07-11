class Solution {
  int shortestBridge(List<List<int>> grid) {
    int n = grid.length;
    List<List<int>> directions = [[-1, 0], [1, 0], [0, 1], [0, -1]];
    List<List<bool>> visited = List.generate(n, (_) => List.filled(n, false));
    List<List<int>> q = [];
    
    void dfs(int r, int c) {
      visited[r][c] = true;
      for (var d in directions) {
        int nr = r + d[0], nc = c + d[1];
        if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
          if (grid[nr][nc] == 0) {
            visited[nr][nc] = true;
            q.add([nr, nc, 1]);
          } else {
            dfs(nr, nc);
          }
        }
      }
    }
    
    bool found = false;
    for (int i = 0; i < n && !found; i++) {
      for (int j = 0; j < n && !found; j++) {
        if (grid[i][j] == 1) {
          dfs(i, j);
          found = true;
        }
      }
    }
    
    while (q.isNotEmpty) {
      var cur = q.removeAt(0);
      int r = cur[0], c = cur[1], dist = cur[2];
      for (var d in directions) {
        int nr = r + d[0], nc = c + d[1];
        if (nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc]) {
          if (grid[nr][nc] == 1) return dist;
          visited[nr][nc] = true;
          q.add([nr, nc, dist + 1]);
        }
      }
    }
    return 0;
  }
}
