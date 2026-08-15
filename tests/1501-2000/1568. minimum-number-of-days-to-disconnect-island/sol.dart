class Solution {
  int minDays(List<List<int>> grid) {
    int countIslands() {
      List<List<bool>> seen = List.generate(
          grid.length, (_) => List<bool>.filled(grid[0].length, false));
      List<List<int>> dirs = [[-1,0],[1,0],[0,-1],[0,1]];
      int islands = 0;
      
      for (int i = 0; i < grid.length; i++) {
        for (int j = 0; j < grid[0].length; j++) {
          if (grid[i][j] == 1 && !seen[i][j]) {
            islands++;
            List<List<int>> stack = [[i,j]];
            seen[i][j] = true;
            while (stack.isNotEmpty) {
              List<int> cell = stack.removeLast();
              for (List<int> d in dirs) {
                int nx = cell[0] + d[0];
                int ny = cell[1] + d[1];
                if (nx >= 0 && nx < grid.length && ny >= 0 && ny < grid[0].length && grid[nx][ny] == 1 && !seen[nx][ny]) {
                  seen[nx][ny] = true;
                  stack.add([nx,ny]);
                }
              }
            }
          }
        }
      }
      return islands;
    }
    
    if (countIslands() != 1) return 0;
    
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        if (grid[i][j] == 1) {
          grid[i][j] = 0;
          if (countIslands() != 1) return 1;
          grid[i][j] = 1;
        }
      }
    }
    return 2;
  }
}
