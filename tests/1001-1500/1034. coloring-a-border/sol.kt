class Solution {
    fun colorBorder(grid: Array<IntArray>, row: Int, col: Int, color: Int): Array<IntArray> {
        val rows = grid.size
        val cols = grid[0].size
        val startColor = grid[row][col]
        
        if (startColor == color) {
            return grid
        }
        
        val queue = java.util.LinkedList<IntArray>()
        queue.offer(intArrayOf(row, col))
        val visited = Array(rows) { BooleanArray(cols) }
        visited[row][col] = true
        val borders = mutableListOf<IntArray>()
        
        val dirs = arrayOf(intArrayOf(-1, 0), intArrayOf(1, 0), intArrayOf(0, -1), intArrayOf(0, 1))
        
        while (queue.isNotEmpty()) {
            val cur = queue.poll()
            val r = cur[0]
            val c = cur[1]
            var isBorder = false
            
            for (dir in dirs) {
                val nr = r + dir[0]
                val nc = c + dir[1]
                
                if (nr !in 0 until rows || nc !in 0 until cols) {
                    isBorder = true
                } else if (grid[nr][nc] != startColor) {
                    isBorder = true
                } else if (!visited[nr][nc]) {
                    visited[nr][nc] = true
                    queue.offer(intArrayOf(nr, nc))
                }
            }
            
            if (isBorder) {
                borders.add(intArrayOf(r, c))
            }
        }
        
        for (cell in borders) {
            grid[cell[0]][cell[1]] = color
        }
        
        return grid
    }
}
