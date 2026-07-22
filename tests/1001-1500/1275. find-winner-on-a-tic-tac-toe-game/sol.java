class Solution {
    public String tictactoe(int[][] moves) {
        String[][] board = new String[3][3];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                board[i][j] = "";
            }
        }
        boolean isA = true;
        for (int[] move : moves) {
            int r = move[0], c = move[1];
            board[r][c] = isA ? "X" : "O";
            isA = !isA;
        }

        for (int i = 0; i < 3; i++) {
            if (!board[i][0].isEmpty() && board[i][0].equals(board[i][1]) && board[i][1].equals(board[i][2])) {
                return board[i][0].equals("X") ? "A" : "B";
            }
            if (!board[0][i].isEmpty() && board[0][i].equals(board[1][i]) && board[1][i].equals(board[2][i])) {
                return board[0][i].equals("X") ? "A" : "B";
            }
        }

        if (!board[1][1].isEmpty() && ((board[0][0].equals(board[1][1]) && board[1][1].equals(board[2][2])) || (board[0][2].equals(board[1][1]) && board[1][1].equals(board[2][0])))) {
            return board[1][1].equals("X") ? "A" : "B";
        }

        return moves.length == 9 ? "Draw" : "Pending";
    }
}
