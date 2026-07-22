public class Solution {
    public string Tictactoe(int[][] moves) {
        string[][] board = new string[3][];
        for (int i = 0; i < 3; i++) {
            board[i] = new string[3];
            for (int j = 0; j < 3; j++) {
                board[i][j] = "";
            }
        }
        bool isA = true;
        foreach (var move in moves) {
            int r = move[0], c = move[1];
            board[r][c] = isA ? "X" : "O";
            isA = !isA;
        }

        for (int i = 0; i < 3; i++) {
            if (!string.IsNullOrEmpty(board[i][0]) && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
                return board[i][0] == "X" ? "A" : "B";
            }
            if (!string.IsNullOrEmpty(board[0][i]) && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
                return board[0][i] == "X" ? "A" : "B";
            }
        }

        if (!string.IsNullOrEmpty(board[1][1]) && ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) || (board[0][2] == board[1][1] && board[1][1] == board[2][0]))) {
            return board[1][1] == "X" ? "A" : "B";
        }

        return moves.Length == 9 ? "Draw" : "Pending";
    }
}
