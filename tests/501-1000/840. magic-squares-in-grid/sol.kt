class Solution {
    fun numMagicSquaresInside(grid: Array<IntArray>): Int {
        val m = grid.size; val n = grid[0].size; var c = 0
        for (i in 0 until m-2) {
            for (j in 0 until n-2) {
                if (isMagicSquare(grid, i, j)) c++
            }
        }
        return c
    }

    private fun isMagicSquare(grid: Array<IntArray>, r: Int, c: Int): Boolean {
        if (grid[r+1][c+1] != 5) return false

        val a = grid[r][c]; val b = grid[r][c+1]; val d = grid[r][c+2]
        val e = grid[r+1][c]; val f = grid[r+1][c+2]
        val h = grid[r+2][c]; val i = grid[r+2][c+1]; val j = grid[r+2][c+2]

        val seen = BooleanArray(10)
        val arr = intArrayOf(a, b, d, e, f, h, i, j, 5)
        for (x in arr) {
            if (x < 1 || x > 9 || seen[x]) return false
            seen[x] = true
        }

        if (a + j != 10) return false
        if (b + i != 10) return false
        if (d + h != 10) return false
        if (e + f != 10) return false

        if (a + b + d != 15) return false
        if (h + i + j != 15) return false
        if (a + e + h != 15) return false
        if (d + f + j != 15) return false
        if (a + 5 + j != 15) return false
        if (d + 5 + h != 15) return false

        return true
    }
}
