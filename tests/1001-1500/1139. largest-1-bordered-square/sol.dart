class Solution {
  int largest1BorderedSquare(List<List<int>> grid) {
    final rows = grid.length;
    final cols = grid[0].length;

    final right = List.generate(rows, (_) => List.filled(cols, 0));
    final down = List.generate(rows, (_) => List.filled(cols, 0));

    for (var r = rows - 1; r >= 0; r--) {
      for (var c = cols - 1; c >= 0; c--) {
        if (grid[r][c] == 1) {
          right[r][c] = 1 + (c + 1 < cols ? right[r][c + 1] : 0);
          down[r][c] = 1 + (r + 1 < rows ? down[r + 1][c] : 0);
        }
      }
    }

    final maxSize = rows < cols ? rows : cols;
    for (var size = maxSize; size >= 1; size--) {
      final edge = size - 1;
      for (var top = 0; top + edge < rows; top++) {
        final bottom = top + edge;
        for (var left = 0; left + edge < cols; left++) {
          final rightCol = left + edge;
          if (right[top][left] >= size &&
              right[bottom][left] >= size &&
              down[top][left] >= size &&
              down[top][rightCol] >= size) {
            return size * size;
          }
        }
      }
    }

    return 0;
  }
}
