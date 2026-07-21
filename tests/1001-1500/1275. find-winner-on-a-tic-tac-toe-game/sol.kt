class Solution {
    fun tictactoe(moves: Array<IntArray>): String {
        val board = Array(3) { Array(3) { "" } }
        var isA = true
        for (move in moves) {
            val r = move[0]
            val c = move[1]
            board[r][c] = if (isA) "X" else "O"
            isA = !isA
        }

        for (i in 0..2) {
            if (board[i][0].isNotEmpty() && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
                return if (board[i][0] == "X") "A" else "B"
            }
            if (board[0][i].isNotEmpty() && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
                return if (board[0][i] == "X") "A" else "B"
            }
        }

        if (board[1][1].isNotEmpty() && ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) || (board[0][2] == board[1][1] && board[1][1] == board[2][0]))) {
            return if (board[1][1] == "X") "A" else "B"
        }

        return if (moves.size == 9) "Draw" else "Pending"
    }
}
