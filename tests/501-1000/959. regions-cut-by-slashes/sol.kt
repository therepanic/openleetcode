class Solution {
    fun regionsBySlashes(grid: Array<String>): Int {
        val n = grid.size
        val parents = IntArray(4 * n * n) { it }
        var count = 4 * n * n

        fun find(x: Int): Int {
            if (x != parents[x]) {
                parents[x] = find(parents[x])
            }
            return parents[x]
        }

        fun union(x: Int, y: Int): Boolean {
            val rx = find(x)
            val ry = find(y)
            if (rx != ry) {
                parents[rx] = ry
                return true
            }
            return false
        }

        val merges = mapOf(
            ' ' to arrayOf(intArrayOf(0, 1), intArrayOf(1, 2), intArrayOf(2, 3)),
            '/' to arrayOf(intArrayOf(0, 3), intArrayOf(1, 2)),
            '\\' to arrayOf(intArrayOf(0, 1), intArrayOf(2, 3))
        )

        for (i in 0 until n) {
            for (j in 0 until n) {
                val base = (i * n + j) * 4
                for (pair in merges[grid[i][j]]!!) {
                    val u = pair[0]
                    val v = pair[1]
                    if (union(base + u, base + v)) {
                        count--
                    }
                }

                if (i + 1 < n) {
                    val downBase = ((i + 1) * n + j) * 4
                    if (union(base + 2, downBase)) {
                        count--
                    }
                }

                if (j + 1 < n) {
                    val rightBase = (i * n + (j + 1)) * 4
                    if (union(base + 1, rightBase + 3)) {
                        count--
                    }
                }
            }
        }
        return count
    }
}
