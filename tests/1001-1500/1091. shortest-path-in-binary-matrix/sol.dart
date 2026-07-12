class Solution {
  int shortestPathBinaryMatrix(List<List<int>> grid) {
    int n = grid.length;
    
    if (grid[0][0] == 1 || grid[n - 1][n - 1] == 1) {
      return -1;
    }
    
    if (n == 1) {
      return 1;
    }
    
    List<List<int>> dist = List.generate(n, (_) => List.filled(n, 0x7fffffffffffffff));
    dist[0][0] = 1;
    
    Queue<List<int>> q = Queue();
    q.add([0, 0, 1]);
    
    List<List<int>> directions = [
      [-1, 0], [-1, -1], [0, 1], [-1, 1],
      [1, 0], [1, -1], [0, -1], [1, 1]
    ];
    
    while (q.isNotEmpty) {
      List<int> curr = q.removeFirst();
      int r = curr[0], c = curr[1], dis = curr[2];
      
      for (List<int> dir in directions) {
        int nr = r + dir[0];
        int nc = c + dir[1];
        
        if (nr >= 0 && nr < n && nc >= 0 && nc < n &&
            grid[nr][nc] == 0 && dis + 1 < dist[nr][nc]) {
          
          dist[nr][nc] = dis + 1;
          
          if (nr == n - 1 && nc == n - 1) {
            return dis + 1;
          }
          
          q.add([nr, nc, dis + 1]);
        }
      }
    }
    
    return -1;
  }
}
