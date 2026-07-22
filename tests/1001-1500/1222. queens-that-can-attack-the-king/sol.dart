class Solution {
  List<List<int>> queensAttacktheKing(List<List<int>> queens, List<int> king) {
    var board = List.generate(8, (_) => List.filled(8, false));
    for (var q in queens) {
      board[q[0]][q[1]] = true;
    }

    var directions = [
      [-1, 0], [1, 0], [0, 1], [0, -1],
      [-1, -1], [-1, 1], [1, -1], [1, 1]
    ];

    var ans = <List<int>>[];
    for (var d in directions) {
      int r = king[0], c = king[1];
      while (r >= 0 && r < 8 && c >= 0 && c < 8) {
        r += d[0];
        c += d[1];
        if (r < 0 || r >= 8 || c < 0 || c >= 8) break;
        if (board[r][c]) {
          ans.add([r, c]);
          break;
        }
      }
    }
    return ans;
  }
}
