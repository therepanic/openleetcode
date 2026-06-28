class Solution {
  int maxAreaOfIsland(List<List<int>> grid) {
    int rows = grid.length;
    int cols = grid[0].length;
    List<List<bool>> visited = List.generate(rows, (_) => List.filled(cols, false));
    int maxIsland = 0;
    
    int dfs(int r, int c) {
      if (r < 0 || r >= rows || c < 0 || c >= cols || visited[r][c] || grid[r][c] == 0) {
        return 0;
      }
      
      visited[r][c] = true;
      
      return 1 + dfs(r+1, c) + dfs(r-1, c) + dfs(r, c+1) + dfs(r, c-1);
    }
    
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 1 && !visited[r][c]) {
          int area = dfs(r, c);
          if (area > maxIsland) {
            maxIsland = area;
          }
        }
      }
    }
    
    return maxIsland;
  }
}
