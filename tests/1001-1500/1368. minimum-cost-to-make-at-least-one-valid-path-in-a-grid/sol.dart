class Solution {
  int minCost(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    List<List<int>> minCost = List.generate(m, (_) => List.filled(n, 1 << 30));
    minCost[0][0] = 0;
    
    List<List<int>> queue = [];
    queue.add([0, 0]);
    
    List<List<int>> directions = [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0]
    ];
    
    while (queue.isNotEmpty) {
      List<int> curr = queue.removeAt(0);
      int r = curr[0];
      int c = curr[1];
      
      for (int i = 0; i < 4; i++) {
        int nr = r + directions[i][0];
        int nc = c + directions[i][1];
        int cost = (grid[r][c] != i + 1) ? 1 : 0;
        
        if (nr >= 0 && nr < m && nc >= 0 && nc < n && minCost[r][c] + cost < minCost[nr][nc]) {
          minCost[nr][nc] = minCost[r][c] + cost;
          
          if (cost == 1) {
            queue.add([nr, nc]);
          } else {
            queue.insert(0, [nr, nc]);
          }
        }
      }
    }
    
    return minCost[m - 1][n - 1];
  }
}
