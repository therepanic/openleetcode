class Solution {
  bool hasValidPath(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    
    Map<int, List<List<int>>> dir = {
      1: [[0, -1], [0, 1]],
      2: [[-1, 0], [1, 0]],
      3: [[0, -1], [1, 0]],
      4: [[0, 1], [1, 0]],
      5: [[0, -1], [-1, 0]],
      6: [[0, 1], [-1, 0]]
    };
    
    List<List<bool>> vis = List.generate(m, (_) => List.filled(n, false));
    List<List<int>> q = [[0, 0]];
    vis[0][0] = true;
    
    while (q.isNotEmpty) {
      int r = q[0][0];
      int c = q[0][1];
      q.removeAt(0);
      
      if (r == m - 1 && c == n - 1) {
        return true;
      }
      
      for (var d in dir[grid[r][c]]!) {
        int nr = r + d[0];
        int nc = c + d[1];
        
        if (nr < 0 || nc < 0 || nr >= m || nc >= n || vis[nr][nc]) {
          continue;
        }
        
        for (var bd in dir[grid[nr][nc]]!) {
          if (nr + bd[0] == r && nc + bd[1] == c) {
            vis[nr][nc] = true;
            q.add([nr, nc]);
          }
        }
      }
    }
    
    return false;
  }
}
