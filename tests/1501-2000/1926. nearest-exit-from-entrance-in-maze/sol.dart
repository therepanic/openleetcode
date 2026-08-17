class Solution {
  int nearestExit(List<List<String>> maze, List<int> entrance) {
    int n = maze.length, m = maze[0].length;
    List<List<bool>> visited = List.generate(n, (_) => List.filled(m, false));
    Queue<List<int>> q = Queue();
    q.add([entrance[0], entrance[1], 0]);
    visited[entrance[0]][entrance[1]] = true;
    List<List<int>> dirs = [[-1,0],[1,0],[0,-1],[0,1]];
    
    while(q.isNotEmpty) {
      var cell = q.removeFirst();
      int r = cell[0], c = cell[1], dist = cell[2];
      for(var d in dirs) {
        int nr = r + d[0], nc = c + d[1];
        if(nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr][nc] && maze[nr][nc] == ".") {
          visited[nr][nc] = true;
          if(nr == 0 || nc == 0 || nr == n-1 || nc == m-1) return dist+1;
          q.add([nr, nc, dist+1]);
        }
      }
    }
    return -1;
  }
}
