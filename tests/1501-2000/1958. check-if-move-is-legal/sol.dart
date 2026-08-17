class Solution {
  bool checkMove(List<List<String>> board, int rMove, int cMove, String color) {
    String opposite = color == 'B' ? 'W' : 'B';
    List<List<int>> dirs = [
      [-1,-1],[-1,0],[-1,1],
      [0,-1], [0,1],
      [1,-1],[1,0],[1,1]
    ];

    for (var d in dirs) {
      int r = rMove + d[0];
      int c = cMove + d[1];
      int cnt = 0;

      while (r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == opposite) {
        r += d[0];
        c += d[1];
        cnt++;
      }

      if (cnt >= 1 && r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == color) {
        return true;
      }
    }

    return false;
  }
}
