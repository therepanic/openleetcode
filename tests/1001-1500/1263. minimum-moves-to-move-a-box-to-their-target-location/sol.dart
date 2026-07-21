class Solution {
  int minPushBox(List<List<String>> grid) {
    int rows = grid.length, cols = grid[0].length;
    List<int> player = [], box = [], target = [];
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid[i][j] == 'S') player = [i, j];
        else if (grid[i][j] == 'B') box = [i, j];
        else if (grid[i][j] == 'T') target = [i, j];
      }
    }
    
    List<List<int>> dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];
    Queue<List<int>> q = Queue();
    q.add([box[0], box[1], player[0], player[1], 0]);
    Set<String> seen = {};
    seen.add("${box[0]},${box[1]},${player[0]},${player[1]}");
    
    while (q.isNotEmpty) {
      var cur = q.removeFirst();
      int bx = cur[0], by = cur[1], px = cur[2], py = cur[3], pushes = cur[4];
      if (bx == target[0] && by == target[1]) return pushes;
      
      Set<String> reachable = {};
      Queue<List<int>> walk = Queue();
      walk.add([px, py]);
      reachable.add("$px,$py");
      
      while (walk.isNotEmpty) {
        var w = walk.removeFirst();
        for (var d in dirs) {
          int nx = w[0] + d[0], ny = w[1] + d[1];
          if (nx >= 0 && nx < rows && ny >= 0 && ny < cols &&
              !(nx == bx && ny == by) && grid[nx][ny] != '#' &&
              !reachable.contains("$nx,$ny")) {
            reachable.add("$nx,$ny");
            walk.add([nx, ny]);
          }
        }
      }
      
      for (var d in dirs) {
        int nbx = bx + d[0], nby = by + d[1];
        int behindX = bx - d[0], behindY = by - d[1];
        if (nbx >= 0 && nbx < rows && nby >= 0 && nby < cols &&
            grid[nbx][nby] != '#' &&
            reachable.contains("$behindX,$behindY") &&
            !seen.contains("$nbx,$nby,$bx,$by")) {
          seen.add("$nbx,$nby,$bx,$by");
          q.add([nbx, nby, bx, by, pushes + 1]);
        }
      }
    }
    return -1;
  }
}
