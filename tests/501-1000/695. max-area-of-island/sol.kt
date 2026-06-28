class Solution {
    fun maxAreaOfIsland(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        val visited = Array(rows) { BooleanArray(cols) }
        var maxIsland = 0
        
        fun dfs(r: Int, c: Int): Int {
            if (r < 0 || r >= rows || c < 0 || c >= cols || visited[r][c] || grid[r][c] == 0) {
                return 0
            }
            
            visited[r][c] = true
            
            return 1 + dfs(r+1, c) + dfs(r-1, c) + dfs(r, c+1) + dfs(r, c-1)
        }
        
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] == 1 && !visited[r][c]) {
                    maxIsland = maxOf(maxIsland, dfs(r, c))
                }
            }
        }
        
        return maxIsland
    }
}
