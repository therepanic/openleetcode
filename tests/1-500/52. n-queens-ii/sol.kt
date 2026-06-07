class Solution {
    private var count: Int = 0
    private lateinit var cols: BooleanArray
    private lateinit var diag1: BooleanArray
    private lateinit var diag2: BooleanArray
    private var n: Int = 0

    fun totalNQueens(n: Int): Int {
        this.n = n
        count = 0
        cols = BooleanArray(n)
        diag1 = BooleanArray(2 * n)
        diag2 = BooleanArray(2 * n)
        backtrack(0)
        return count
    }

    private fun backtrack(row: Int) {
        if (row == n) {
            count++
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
            backtrack(row + 1)
            cols[col] = false
            diag1[d1] = false
            diag2[d2] = false
        }
    }
}
