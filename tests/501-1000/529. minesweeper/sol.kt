class Solution {
    fun updateBoard(board: Array<CharArray>, click: IntArray): Array<CharArray> {
        val directions = arrayOf(
            intArrayOf(-1, -1), intArrayOf(-1, 0), intArrayOf(-1, 1),
            intArrayOf(0, -1), intArrayOf(0, 1),
            intArrayOf(1, -1), intArrayOf(1, 0), intArrayOf(1, 1)
        )
        val rows = board.size
        val cols = board[0].size
        val r = click[0]
        val c = click[1]

        if (board[r][c] == 'M') {
            board[r][c] = 'X'
            return board
        }

        fun countMines(r: Int, c: Int): Int {
            var count = 0
            for (dir in directions) {
                val nr = r + dir[0]
                val nc = c + dir[1]
                if (nr in 0 until rows && nc in 0 until cols && board[nr][nc] == 'M') {
                    count++
                }
            }
            return count
        }

        fun reveal(r: Int, c: Int) {
            if (r !in 0 until rows || c !in 0 until cols || board[r][c] != 'E') {
                return
            }
            val mines = countMines(r, c)
            if (mines > 0) {
                board[r][c] = '0' + mines
            } else {
                board[r][c] = 'B'
                for (dir in directions) {
                    reveal(r + dir[0], c + dir[1])
                }
            }
        }

        reveal(r, c)
        return board
    }
}
