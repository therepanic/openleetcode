class Solution {
  int islandPerimeter(List<List<int>> grid) {
    int rows = grid.length;
    int cols = grid[0].length;
    Set<String> visited = {};
    
    int startR = -1, startC = -1;
    outer:
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 1) {
          startR = r;
          startC = c;
          break outer;
        }
      }
    }
    
    List<List<int>> queue = [[startR, startC]];
    visited.add("$startR,$startC");
    int perimeter = 0;
    
    List<List<int>> dirs = [[-1,0],[1,0],[0,-1],[0,1]];
    
    while (queue.isNotEmpty) {
      var curr = queue.removeAt(0);
      int r = curr[0], c = curr[1];
      
      for (var dir in dirs) {
        int nr = r + dir[0];
        int nc = c + dir[1];
        
        if (nr < 0 || nr >= rows || nc < 0 || nc >= cols || grid[nr][nc] == 0) {
          perimeter++;
        } else if (!visited.contains("$nr,$nc")) {
          visited.add("$nr,$nc");
          queue.add([nr, nc]);
        }
      }
    }
    
    return perimeter;
  }
}
