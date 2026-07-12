class Solution {
  int orangesRotting(List<List<int>> grid) {
    int n = grid.length, m = grid[0].length;
    List<List<int>> q = [];
    int fresh = 0;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (grid[i][j] == 2) {
          q.add([i, j, 0]);
        } else if (grid[i][j] == 1) {
          fresh++;
        }
      }
    }

    List<List<int>> directions = [[-1,0],[1,0],[0,-1],[0,1]];
    int maxTime = 0, rotten = 0;

    while (q.isNotEmpty) {
      var cur = q.removeAt(0);
      int r = cur[0], c = cur[1], t = cur[2];
      if (t > maxTime) maxTime = t;

      for (var dir in directions) {
        int nr = r + dir[0], nc = c + dir[1];
        if (nr >= 0 && nr < n && nc >= 0 && nc < m && grid[nr][nc] == 1) {
          grid[nr][nc] = 2;
          q.add([nr, nc, t + 1]);
          rotten++;
        }
      }
    }

    return rotten == fresh ? maxTime : -1;
  }
}
