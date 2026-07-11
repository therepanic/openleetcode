class Solution {
  List<List<int>> colorBorder(List<List<int>> grid, int row, int col, int color) {
    int rows = grid.length;
    int cols = grid[0].length;
    int startColor = grid[row][col];
    
    if (startColor == color) {
      return grid;
    }
    
    List<List<int>> queue = [[row, col]];
    List<List<bool>> visited = List.generate(rows, (_) => List.filled(cols, false));
    visited[row][col] = true;
    List<List<int>> borders = [];
    
    List<List<int>> dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    while (queue.isNotEmpty) {
      List<int> cur = queue.removeAt(0);
      int r = cur[0], c = cur[1];
      bool isBorder = false;
      
      for (var dir in dirs) {
        int nr = r + dir[0];
        int nc = c + dir[1];
        
        if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) {
          isBorder = true;
        } else if (grid[nr][nc] != startColor) {
          isBorder = true;
        } else if (!visited[nr][nc]) {
          visited[nr][nc] = true;
          queue.add([nr, nc]);
        }
      }
      
      if (isBorder) {
        borders.add([r, c]);
      }
    }
    
    for (var cell in borders) {
      grid[cell[0]][cell[1]] = color;
    }
    
    return grid;
  }
}
