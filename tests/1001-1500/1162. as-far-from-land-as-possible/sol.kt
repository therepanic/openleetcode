class Solution {
    fun maxDistance(grid: Array<IntArray>): Int {
        if (grid.isEmpty() || grid[0].isEmpty()) {
            return -1
        }
        
        val n = grid.size
        val frontier = ArrayDeque<Pair<Int, Int>>()
        
        for (r in 0 until n) {
            for (c in 0 until n) {
                if (grid[r][c] == 1) {
                    frontier.add(Pair(r, c))
                }
            }
        }
        
        if (frontier.isEmpty() || frontier.size == n * n) {
            return -1
        }
        
        val directions = listOf(-1 to 0, 1 to 0, 0 to -1, 0 to 1)
        var distance = -1
        
        while (frontier.isNotEmpty()) {
            val size = frontier.size
            distance++
            
            repeat(size) {
                val (r, c) = frontier.removeFirst()
                
                for ((dr, dc) in directions) {
                    val nr = r + dr
                    val nc = c + dc
                    
                    if (nr in 0 until n && nc in 0 until n && grid[nr][nc] == 0) {
                        grid[nr][nc] = 1
                        frontier.add(Pair(nr, nc))
                    }
                }
            }
        }
        
        return distance
    }
}
