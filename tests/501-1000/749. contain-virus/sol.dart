import 'dart:collection';

class Solution {
  int containVirus(List<List<int>> isInfected) {
    int rows = isInfected.length;
    int cols = isInfected[0].length;
    List<List<int>> directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];
    int totalWalls = 0;

    while (true) {
      List<List<bool>> seen = List.generate(rows, (_) => List.filled(cols, false));
      List<List<List<int>>> regions = [];
      List<Set<String>> frontiers = [];
      List<int> wallsNeeded = [];

      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          if (isInfected[r][c] != 1 || seen[r][c]) continue;
          Queue<List<int>> stack = Queue();
          stack.addLast([r, c]);
          seen[r][c] = true;
          List<List<int>> region = [];
          Set<String> frontier = {};
          int walls = 0;
          while (stack.isNotEmpty) {
            List<int> cell = stack.removeLast();
            int cr = cell[0], cc = cell[1];
            region.add([cr, cc]);
            for (var d in directions) {
              int nr = cr + d[0];
              int nc = cc + d[1];
              if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;
              if (isInfected[nr][nc] == 1 && !seen[nr][nc]) {
                seen[nr][nc] = true;
                stack.addLast([nr, nc]);
              } else if (isInfected[nr][nc] == 0) {
                walls++;
                frontier.add('$nr,$nc');
              }
            }
          }
          regions.add(region);
          frontiers.add(frontier);
          wallsNeeded.add(walls);
        }
      }

      if (regions.isEmpty) break;

      int target = 0;
      for (int i = 1; i < frontiers.length; i++) {
        if (frontiers[i].length > frontiers[target].length) {
          target = i;
        }
      }

      if (frontiers[target].isEmpty) break;

      totalWalls += wallsNeeded[target];

      for (var cell in regions[target]) {
        isInfected[cell[0]][cell[1]] = -1;
      }

      for (int i = 0; i < regions.length; i++) {
        if (i == target) continue;
        for (var coord in frontiers[i]) {
          var parts = coord.split(',');
          int r = int.parse(parts[0]);
          int c = int.parse(parts[1]);
          isInfected[r][c] = 1;
        }
      }
    }

    return totalWalls;
  }
}
