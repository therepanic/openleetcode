class Solution {
    fun kthSmallestPath(destination: IntArray, k: Int): String {
        var rows = destination[0]
        var cols = destination[1]
        val path = StringBuilder()
        var kLocal = (k - 1).toLong()

        while (rows > 0 || cols > 0) {
            val pathsWithH: Long
            if (cols > 0) {
                pathsWithH = combination(rows + cols - 1, cols - 1)
            } else {
                pathsWithH = 0
            }

            if (kLocal < pathsWithH) {
                path.append('H')
                cols--
            } else {
                path.append('V')
                kLocal -= pathsWithH
                rows--
            }
        }
        return path.toString()
    }

    private fun combination(n: Int, r: Int): Long {
        if (r == 0 || r == n) return 1
        var rLocal = minOf(r, n - r)
        var result: Long = 1
        for (i in 1..rLocal) {
            result = result * (n - rLocal + i) / i
        }
        return result
    }
}
