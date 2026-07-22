class Solution {
  int maxDistance(List<List<int>> grid) {
    if (grid.isEmpty || grid[0].isEmpty) {
      return -1;
    }
    
    int n = grid.length;
    List<List<int>> frontier = [];
    
    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        if (grid[r][c] == 1) {
          frontier.add([r, c]);
        }
      }
    }
    
    if (frontier.isEmpty || frontier.length == n * n) {
      return -1;
    }
    
    List<List<int>> directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    int distance = -1;
    
    while (frontier.isNotEmpty) {
      List<List<int>> nextFrontier = [];
      distance++;
      
      for (var cell in frontier) {
        int r = cell[0], c = cell[1];
        
        for (var dir in directions) {
          int nr = r + dir[0];
          int nc = c + dir[1];
          
          if (nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0) {
            grid[nr][nc] = 1;
            nextFrontier.add([nr, nc]);
          }
        }
      }
      
      frontier = nextFrontier;
    }
    
    return distance;
  }
}
