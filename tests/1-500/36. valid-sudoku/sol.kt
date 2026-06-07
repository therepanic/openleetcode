class Solution {
    fun isValidSudoku(board: Array<CharArray>): Boolean {
        val rows = Array(9) { BooleanArray(9) }
        val cols = Array(9) { BooleanArray(9) }
        val boxes = Array(9) { BooleanArray(9) }

        for (i in 0 until 9) {
            for (j in 0 until 9) {
                if (board[i][j] == '.') continue
                val num = board[i][j] - '1'
                val box = (i / 3) * 3 + (j / 3)
                if (rows[i][num] || cols[j][num] || boxes[box][num]) return false
                rows[i][num] = true
                cols[j][num] = true
                boxes[box][num] = true
            }
        }

        return true
    }
}
