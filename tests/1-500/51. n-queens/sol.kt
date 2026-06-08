class Solution {
    private lateinit var res: MutableList<List<String>>
    private lateinit var board: Array<CharArray>
    private lateinit var cols: BooleanArray
    private lateinit var diag1: BooleanArray
    private lateinit var diag2: BooleanArray
    private var n: Int = 0

    fun solveNQueens(n: Int): List<List<String>> {
        this.n = n
        res = mutableListOf()
        board = Array(n) { CharArray(n) { '.' } }
        cols = BooleanArray(n)
        diag1 = BooleanArray(2 * n)
        diag2 = BooleanArray(2 * n)
        backtrack(0)
        return res
    }

    private fun backtrack(row: Int) {
        if (row == n) {
            val cur = mutableListOf<String>()
            for (r in 0 until n) {
                cur.add(String(board[r]))
            }
            res.add(cur)
            return
        }
        for (col in 0 until n) {
            val d1 = row + col
            val d2 = row - col + n - 1
            if (cols[col] || diag1[d1] || diag2[d2]) {
                continue
            }
            cols[col] = true
            diag1[d1] = true
            diag2[d2] = true
            board[row][col] = 'Q'
            backtrack(row + 1)
            board[row][col] = '.'
            cols[col] = false
            diag1[d1] = false
            diag2[d2] = false
        }
    }
}
