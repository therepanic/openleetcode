class Solution {
  bool containsCycle(List<List<String>> grid) {
    final n = grid.length;
    final m = grid[0].length;
    final visited = List.generate(n, (_) => List.filled(m, false));
    final directions = [
      [-1, 0], [1, 0], [0, -1], [0, 1]
    ];
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (!visited[i][j]) {
          if (_bfs(i, j, grid, visited, directions)) return true;
        }
      }
    }
    return false;
  }
  
  bool _bfs(int startI, int startJ, List<List<String>> grid, List<List<bool>> visited, List<List<int>> directions) {
    final n = grid.length;
    final m = grid[0].length;
    final queue = <List<int>>[];
    queue.add([startI, startJ, -1, -1]);
    visited[startI][startJ] = true;
    int head = 0;
    
    while (head < queue.length) {
      final cur = queue[head++];
      final x = cur[0], y = cur[1], px = cur[2], py = cur[3];
      
      for (final d in directions) {
        final nx = x + d[0], ny = y + d[1];
        if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
        if (grid[nx][ny] != grid[x][y]) continue;
        if (nx == px && ny == py) continue;
        if (visited[nx][ny]) return true;
        visited[nx][ny] = true;
        queue.add([nx, ny, x, y]);
      }
    }
    return false;
  }
}
