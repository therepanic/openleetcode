class Solution {
    fun largestMagicSquare(grid: Array<IntArray>): Int {
        val m = grid.size
        val n = grid[0].size
        var res = 1

        fun isValid(i: Int, j: Int, k: Int): Boolean {
            var s = -1
            for (x in i until i + k) {
                val row = (j until j + k).sumOf { grid[x][it] }
                if (s == -1) s = row
                else if (s != row) return false
            }

            for (y in j until j + k) {
                val col = (i until i + k).sumOf { grid[it][y] }
                if (col != s) return false
            }

            val d1 = (0 until k).sumOf { grid[i + it][j + it] }
            val d2 = (0 until k).sumOf { grid[i + it][j + k - 1 - it] }
            return d1 == s && d2 == s
        }

        for (k in 2..minOf(m, n)) {
            for (i in 0..(m - k)) {
                for (j in 0..(n - k)) {
                    if (isValid(i, j, k)) res = k
                }
            }
        }
        return res
    }
}
