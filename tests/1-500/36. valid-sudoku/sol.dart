class Solution {
  bool isValidSudoku(List<List<String>> board) {
    final rows = List.generate(9, (_) => List.filled(9, false));
    final cols = List.generate(9, (_) => List.filled(9, false));
    final boxes = List.generate(9, (_) => List.filled(9, false));

    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        final cell = board[i][j];
        if (cell == '.') continue;
        final num = cell.codeUnitAt(0) - '1'.codeUnitAt(0);
        final box = (i ~/ 3) * 3 + (j ~/ 3);
        if (rows[i][num] || cols[j][num] || boxes[box][num]) {
          return false;
        }
        rows[i][num] = true;
        cols[j][num] = true;
        boxes[box][num] = true;
      }
    }

    return true;
  }
}
