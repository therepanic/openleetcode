import 'dart:collection';

class Solution {
  int numIslands(List<List<String>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;
    var islands = 0;
    const directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ];

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] != '1') {
          continue;
        }
        islands++;
        final queue = Queue<List<int>>();
        queue.add([r, c]);
        grid[r][c] = '0';
        while (queue.isNotEmpty) {
          final cell = queue.removeFirst();
          for (final dir in directions) {
            final nr = cell[0] + dir[0];
            final nc = cell[1] + dir[1];
            if (nr >= 0 &&
                nr < rows &&
                nc >= 0 &&
                nc < cols &&
                grid[nr][nc] == '1') {
              grid[nr][nc] = '0';
              queue.add([nr, nc]);
            }
          }
        }
      }
    }

    return islands;
  }
}
