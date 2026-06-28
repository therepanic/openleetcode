class Solution {
    fun cutOffTree(forest: Array<IntArray>): Int {
        val rows = forest.size
        val cols = forest[0].size
        
        if (forest[0][0] == 0) return -1
        
        val trees = mutableListOf<Triple<Int, Int, Int>>()
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                val value = forest[r][c]
                if (value > 1) {
                    trees.add(Triple(value, r, c))
                }
            }
        }
        
        trees.sortBy { it.first }
        
        var totalSteps = 0
        var currentRow = 0
        var currentCol = 0
        
        for ((_, targetRow, targetCol) in trees) {
            val steps = findShortestPath(forest, currentRow, currentCol, targetRow, targetCol, rows, cols)
            if (steps == -1) return -1
            
            totalSteps += steps
            currentRow = targetRow
            currentCol = targetCol
        }
        
        return totalSteps
    }
    
    private fun findShortestPath(
        forest: Array<IntArray>,
        startRow: Int,
        startCol: Int,
        targetRow: Int,
        targetCol: Int,
        rows: Int,
        cols: Int
    ): Int {
        val directions = arrayOf(intArrayOf(-1, 0), intArrayOf(0, -1), intArrayOf(0, 1), intArrayOf(1, 0))
        val queue: java.util.Queue<Triple<Int, Int, Int>> = java.util.LinkedList()
        val visited = Array(rows) { BooleanArray(cols) }
        
        queue.offer(Triple(startRow, startCol, 0))
        visited[startRow][startCol] = true
        
        while (queue.isNotEmpty()) {
            val (currRow, currCol, steps) = queue.poll()
            
            if (currRow == targetRow && currCol == targetCol) return steps
            
            for (dir in directions) {
                val newRow = currRow + dir[0]
                val newCol = currCol + dir[1]
                
                if (newRow in 0 until rows && newCol in 0 until cols &&
                    forest[newRow][newCol] > 0 && !visited[newRow][newCol]) {
                    queue.offer(Triple(newRow, newCol, steps + 1))
                    visited[newRow][newCol] = true
                }
            }
        }
        
        return -1
    }
}
