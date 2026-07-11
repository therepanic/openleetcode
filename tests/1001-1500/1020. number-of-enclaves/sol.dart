import 'dart:collection';

class Solution {
  int numEnclaves(List<List<int>> grid) {
    int total = 0;
    for (var row in grid) {
      for (var val in row) {
        total += val;
      }
    }
    
    int m = grid.length;
    int n = grid[0].length;
    if (m == 1 || n == 1) return 0;
    
    Queue<Pair<int, int>> q = Queue();
    Set<String> seen = {};
    
    for (int i = 0; i < n; i++) {
      if (grid[0][i] == 1) {
        q.add(Pair(0, i));
        seen.add("0,$i");
      }
      if (grid[m-1][i] == 1) {
        q.add(Pair(m-1, i));
        seen.add("${m-1},$i");
      }
    }
    for (int i = 1; i < m - 1; i++) {
      if (grid[i][0] == 1) {
        q.add(Pair(i, 0));
        seen.add("$i,0");
      }
      if (grid[i][n-1] == 1) {
        q.add(Pair(i, n-1));
        seen.add("$i,${n-1}");
      }
    }
    
    List<List<int>> directions = [[0,1],[1,0],[0,-1],[-1,0]];
    int nextTotal = 0;
    
    while (q.isNotEmpty) {
      var curr = q.removeFirst();
      int x = curr.first;
      int y = curr.second;
      nextTotal++;
      
      for (var dir in directions) {
        int nx = x + dir[0];
        int ny = y + dir[1];
        String key = "$nx,$ny";
        if (nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] == 1 && !seen.contains(key)) {
          q.add(Pair(nx, ny));
          seen.add(key);
        }
      }
    }
    
    return total - nextTotal;
  }
}

class Pair<F, S> {
  final F first;
  final S second;
  Pair(this.first, this.second);
}
