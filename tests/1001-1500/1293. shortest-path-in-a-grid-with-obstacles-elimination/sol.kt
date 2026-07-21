class Solution {
    fun shortestPath(grid: Array<IntArray>, k: Int): Int {
        val n = grid.size
        val m = grid[0].size
        val q = ArrayDeque<IntArray>()
        q.add(intArrayOf(0, 0, k, 0))
        val visi = HashSet<String>()
        visi.add("0,0,$k")
        val dirs = arrayOf(intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(1, 0), intArrayOf(0, -1))
        while (q.isNotEmpty()) {
            val (r, c, kRem, d) = q.removeFirst()
            if (r == n - 1 && c == m - 1) return d
            var kRem2 = kRem
            if (grid[r][c] == 1) kRem2--
            for ((dr, dc) in dirs) {
                val nr = r + dr
                val nc = c + dc
                if (nr in 0 until n && nc in 0 until m) {
                    val key = "$nr,$nc,$kRem2"
                    if (key !in visi && kRem2 >= 0) {
                        visi.add(key)
                        q.add(intArrayOf(nr, nc, kRem2, d + 1))
                    }
                }
            }
        }
        return -1
    }
}
