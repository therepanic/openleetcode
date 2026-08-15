class Solution {
    fun minimumEffortPath(heights: Array<IntArray>): Int {
        if (heights.isEmpty()) return 0
        val rows = heights.size
        val cols = heights[0].size
        val pq = java.util.PriorityQueue<IntArray>() { a, b -> a[0] - b[0] }
        pq.add(intArrayOf(0, 0, 0))
        var maxEffort = 0
        val visited = Array(rows) { BooleanArray(cols) }
        val dirs = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))
        while (pq.isNotEmpty()) {
            val curr = pq.poll()
            val effort = curr[0]
            val r = curr[1]
            val c = curr[2]
            maxEffort = maxOf(maxEffort, effort)
            if (r == rows - 1 && c == cols - 1) return maxEffort
            if (visited[r][c]) continue
            visited[r][c] = true
            for (d in dirs) {
                val nr = r + d[0]
                val nc = c + d[1]
                if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && !visited[nr][nc]) {
                    val newEffort = kotlin.math.abs(heights[nr][nc] - heights[r][c])
                    pq.add(intArrayOf(newEffort, nr, nc))
                }
            }
        }
        return maxEffort
    }
}
