class Solution {
    fun islandPerimeter(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        val visited = mutableSetOf<String>()
        
        var startR = -1
        var startC = -1
        outer@ for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] == 1) {
                    startR = r
                    startC = c
                    break@outer
                }
            }
        }
        
        val queue: java.util.Queue<IntArray> = java.util.LinkedList()
        queue.offer(intArrayOf(startR, startC))
        visited.add("$startR,$startC")
        var perimeter = 0
        
        val dirs = arrayOf(intArrayOf(-1,0), intArrayOf(1,0), intArrayOf(0,-1), intArrayOf(0,1))
        
        while (queue.isNotEmpty()) {
            val curr = queue.poll()
            val r = curr[0]
            val c = curr[1]
            
            for (dir in dirs) {
                val nr = r + dir[0]
                val nc = c + dir[1]
                
                if (nr < 0 || nr >= rows || nc < 0 || nc >= cols || grid[nr][nc] == 0) {
                    perimeter++
                } else if (!visited.contains("$nr,$nc")) {
                    visited.add("$nr,$nc")
                    queue.offer(intArrayOf(nr, nc))
                }
            }
        }
        
        return perimeter
    }
}
