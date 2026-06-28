class Solution {
  int swimInWater(List<List<int>> grid) {
    int n = grid.length;
    List<List<int>> dirs = [[0,-1],[0,1],[-1,0],[1,0]];
    
    bool dfs(int x, int y, int t, List<List<bool>> vis) {
      if (x == n - 1 && y == n - 1) return true;
      vis[x][y] = true;
      for (var d in dirs) {
        int nx = x + d[0], ny = y + d[1];
        if (nx >= 0 && nx < n && ny >= 0 && ny < n && !vis[nx][ny] && grid[nx][ny] <= t) {
          if (dfs(nx, ny, t, vis)) return true;
        }
      }
      return false;
    }
    
    int low = 0, high = n * n - 1, ans = 1 << 31 - 1;
    while (low <= high) {
      int mid = (low + high) ~/ 2;
      List<List<bool>> vis = List.generate(n, (_) => List.filled(n, false));
      if (grid[0][0] <= mid && dfs(0, 0, mid, vis)) {
        ans = mid;
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }
    return ans;
  }
}
