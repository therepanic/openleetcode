class Solution {
    fun movesToChessboard(board: Array<IntArray>): Int {
        val n = board.size
        
        fun fn(vals: IntArray): Int {
            var total = 0
            var odd = 0
            for (i in vals.indices) {
                if (vals[0] == vals[i]) {
                    total++
                    if (i and 1 == 1) odd++
                } else if (vals[0] xor vals[i] != (1 shl n) - 1) {
                    return Int.MAX_VALUE / 2
                }
            }
            var ans = Int.MAX_VALUE / 2
            if (n <= 2 * total && 2 * total <= n + 1) {
                ans = minOf(ans, odd)
            }
            if (n - 1 <= 2 * total && 2 * total <= n) {
                ans = minOf(ans, total - odd)
            }
            return ans
        }
        
        val rows = IntArray(n)
        val cols = IntArray(n)
        for (i in 0 until n) {
            for (j in 0 until n) {
                if (board[i][j] == 1) {
                    rows[i] = rows[i] xor (1 shl j)
                    cols[j] = cols[j] xor (1 shl i)
                }
            }
        }
        val ans = fn(rows) + fn(cols)
        return if (ans < Int.MAX_VALUE / 2) ans else -1
    }
}
