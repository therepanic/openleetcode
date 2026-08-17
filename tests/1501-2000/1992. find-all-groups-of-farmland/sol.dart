class Solution {
  List<List<int>> findFarmland(List<List<int>> land) {
    int n = land.length;
    int m = land[0].length;
    List<List<bool>> visited = List.generate(n, (_) => List.filled(m, false));
    List<List<int>> directions = [[-1,0],[0,1],[1,0],[0,-1]];
    
    List<int> maxr = [0];
    List<int> maxc = [0];
    
    void dfs(int r, int c) {
      visited[r][c] = true;
      if (r > maxr[0]) maxr[0] = r;
      if (c > maxc[0]) maxc[0] = c;
      for (var d in directions) {
        int nr = r + d[0];
        int nc = c + d[1];
        if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
          if (!visited[nr][nc] && land[nr][nc] == 1) {
            dfs(nr, nc);
          }
        }
      }
    }
    
    List<List<int>> res = [];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (land[i][j] == 1 && !visited[i][j]) {
          maxr[0] = i;
          maxc[0] = j;
          dfs(i, j);
          res.add([i, j, maxr[0], maxc[0]]);
        }
      }
    }
    return res;
  }
}
