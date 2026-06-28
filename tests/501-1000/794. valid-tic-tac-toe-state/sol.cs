public class Solution {
    public bool ValidTicTacToe(string[] board) {
        int countX = 0, countO = 0;
        foreach (string row in board) {
            foreach (char c in row) {
                if (c == 'X') countX++;
                if (c == 'O') countO++;
            }
        }
        
        if (countO > countX || countX > countO + 1) return false;
        
        bool isWinner(char player) {
            for (int i = 0; i < 3; i++) {
                if (board[i][0] == player && board[i][1] == player && board[i][2] == player) return true;
                if (board[0][i] == player && board[1][i] == player && board[2][i] == player) return true;
            }
            if (board[0][0] == player && board[1][1] == player && board[2][2] == player) return true;
            if (board[0][2] == player && board[1][1] == player && board[2][0] == player) return true;
            return false;
        }
        
        bool xWins = isWinner('X');
        bool oWins = isWinner('O');
        
        if (xWins && oWins) return false;
        if (xWins && countX != countO + 1) return false;
        if (oWins && countX != countO) return false;
        
        return true;
    }
}
