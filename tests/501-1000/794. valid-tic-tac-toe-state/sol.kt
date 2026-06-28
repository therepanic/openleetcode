class Solution {
    fun validTicTacToe(board: Array<String>): Boolean {
        val countX = board.sumOf { row -> row.count { it == 'X' } }
        val countO = board.sumOf { row -> row.count { it == 'O' } }
        
        if (countO > countX || countX > countO + 1) return false
        
        fun isWinner(player: Char): Boolean {
            for (i in 0..2) {
                if (board[i][0] == player && board[i][1] == player && board[i][2] == player) return true
                if (board[0][i] == player && board[1][i] == player && board[2][i] == player) return true
            }
            if (board[0][0] == player && board[1][1] == player && board[2][2] == player) return true
            if (board[0][2] == player && board[1][1] == player && board[2][0] == player) return true
            return false
        }
        
        val xWins = isWinner('X')
        val oWins = isWinner('O')
        
        if (xWins && oWins) return false
        if (xWins && countX != countO + 1) return false
        if (oWins && countX != countO) return false
        
        return true
    }
}
