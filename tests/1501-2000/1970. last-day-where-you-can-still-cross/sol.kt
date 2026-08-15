class Solution {
    fun latestDayToCross(row: Int, col: Int, cells: Array<IntArray>): Int {
        var left = 1
        var right = cells.size
        var answer = 0
        while (left <= right) {
            val mid = (left + right) / 2
            if (canCross(mid, row, col, cells)) {
                answer = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return answer
    }
    
    private fun canCross(day: Int, row: Int, col: Int, cells: Array<IntArray>): Boolean {
        val grid = Array(row) { IntArray(col) }
        for (i in 0 until day) {
            val r = cells[i][0] - 1
            val c = cells[i][1] - 1
            grid[r][c] = 1
        }
        
        val queueR = IntArray(row * col)
        val queueC = IntArray(row * col)
        var head = 0
        var tail = 0
        val visited = Array(row) { BooleanArray(col) }
        
        for (c in 0 until col) {
            if (grid[0][c] == 0) {
                queueR[tail] = 0
                queueC[tail] = c
                tail++
                visited[0][c] = true
            }
        }
        
        val dr = intArrayOf(1, -1, 0, 0)
        val dc = intArrayOf(0, 0, 1, -1)
        
        while (head < tail) {
            val r = queueR[head]
            val c = queueC[head]
            head++
            if (r == row - 1) return true
            for (k in 0 until 4) {
                val nr = r + dr[k]
                val nc = c + dc[k]
                if (nr >= 0 && nr < row && nc >= 0 && nc < col && !visited[nr][nc] && grid[nr][nc] == 0) {
                    visited[nr][nc] = true
                    queueR[tail] = nr
                    queueC[tail] = nc
                    tail++
                }
            }
        }
        return false
    }
}
