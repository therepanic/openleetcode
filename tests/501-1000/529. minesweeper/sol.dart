class Solution {
  List<List<String>> updateBoard(List<List<String>> board, List<int> click) {
    var directions = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1], [0, 1],
      [1, -1], [1, 0], [1, 1]
    ];
    int rows = board.length;
    int cols = board[0].length;
    int r = click[0];
    int c = click[1];

    if (board[r][c] == 'M') {
      board[r][c] = 'X';
      return board;
    }

    int countMines(int r, int c) {
      int count = 0;
      for (var dir in directions) {
        int nr = r + dir[0];
        int nc = c + dir[1];
        if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] == 'M') {
          count++;
        }
      }
      return count;
    }

    void reveal(int r, int c) {
      if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != 'E') {
        return;
      }
      int mines = countMines(r, c);
      if (mines > 0) {
        board[r][c] = mines.toString();
      } else {
        board[r][c] = 'B';
        for (var dir in directions) {
          reveal(r + dir[0], c + dir[1]);
        }
      }
    }

    reveal(r, c);
    return board;
  }
}
