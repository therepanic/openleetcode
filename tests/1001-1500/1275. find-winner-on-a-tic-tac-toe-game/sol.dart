class Solution {
  String tictactoe(List<List<int>> moves) {
    List<List<String>> board = List.generate(3, (_) => List.filled(3, ""));
    bool isA = true;
    for (var move in moves) {
      int r = move[0], c = move[1];
      board[r][c] = isA ? "X" : "O";
      isA = !isA;
    }

    for (int i = 0; i < 3; i++) {
      if (board[i][0].isNotEmpty && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
        return board[i][0] == "X" ? "A" : "B";
      }
      if (board[0][i].isNotEmpty && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
        return board[0][i] == "X" ? "A" : "B";
      }
    }

    if (board[1][1].isNotEmpty && ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) || (board[0][2] == board[1][1] && board[1][1] == board[2][0]))) {
      return board[1][1] == "X" ? "A" : "B";
    }

    return moves.length == 9 ? "Draw" : "Pending";
  }
}
