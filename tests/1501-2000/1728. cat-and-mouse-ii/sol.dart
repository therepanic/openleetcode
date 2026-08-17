class Solution {
  bool canMouseWin(List<String> grid, int catJump, int mouseJump) {
    int m = grid.length, n = grid[0].length;
    Set<int> walls = {};
    int food = -1, cat = -1, mouse = -1;
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int idx = i * n + j;
        if (grid[i][j] == 'F') food = idx;
        else if (grid[i][j] == 'C') cat = idx;
        else if (grid[i][j] == 'M') mouse = idx;
        else if (grid[i][j] == '#') walls.add(idx);
      }
    }
    
    final dirs = [[-1,0],[0,1],[1,0],[0,-1]];
    final memo = Map<int, bool>();
    int maxTurns = m * n * 2;
    
    bool dfs(int c, int mo, int turn) {
      int key = (c * m * n + mo) * maxTurns + turn;
      if (memo.containsKey(key)) return memo[key]!;
      
      if (c == food || c == mo || turn >= maxTurns) {
        memo[key] = false;
        return false;
      }
      if (mo == food) {
        memo[key] = true;
        return true;
      }
      
      bool result;
      if (turn % 2 == 0) { // mouse
        result = false;
        int mx = mo ~/ n, my = mo % n;
        for (var d in dirs) {
          for (int jump = 0; jump <= mouseJump; jump++) {
            int nx = mx + jump * d[0], ny = my + jump * d[1];
            if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.contains(nx * n + ny)) break;
            if (dfs(c, nx * n + ny, turn + 1)) {
              result = true;
              break;
            }
          }
          if (result) break;
        }
      } else { // cat
        result = true;
        int cx = c ~/ n, cy = c % n;
        for (var d in dirs) {
          for (int jump = 0; jump <= catJump; jump++) {
            int nx = cx + jump * d[0], ny = cy + jump * d[1];
            if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.contains(nx * n + ny)) break;
            if (!dfs(nx * n + ny, mo, turn + 1)) {
              result = false;
              break;
            }
          }
          if (!result) break;
        }
      }
      
      memo[key] = result;
      return result;
    }
    
    return dfs(cat, mouse, 0);
  }
}
