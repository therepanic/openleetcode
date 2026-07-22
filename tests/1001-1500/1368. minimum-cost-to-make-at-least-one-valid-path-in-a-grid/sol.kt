class Solution {
    fun minCost(grid: Array<IntArray>): Int {
        val m = grid.size
        val n = grid[0].size
        val minCost = Array(m) { IntArray(n) { Int.MAX_VALUE } }
        minCost[0][0] = 0
        
        val deque = java.util.ArrayDeque<Pair<Int, Int>>()
        deque.offerFirst(Pair(0, 0))
        
        val directions = arrayOf(
            intArrayOf(0, 1),
            intArrayOf(0, -1),
            intArrayOf(1, 0),
            intArrayOf(-1, 0)
        )
        
        while (!deque.isEmpty()) {
            val (r, c) = deque.pollFirst()
            
            for (i in directions.indices) {
                val nr = r + directions[i][0]
                val nc = c + directions[i][1]
                val cost = if (grid[r][c] != i + 1) 1 else 0
                
                if (nr in 0 until m && nc in 0 until n && minCost[r][c] + cost < minCost[nr][nc]) {
                    minCost[nr][nc] = minCost[r][c] + cost
                    
                    if (cost == 1) {
                        deque.offerLast(Pair(nr, nc))
                    } else {
                        deque.offerFirst(Pair(nr, nc))
                    }
                }
            }
        }
        
        return minCost[m - 1][n - 1]
    }
}
