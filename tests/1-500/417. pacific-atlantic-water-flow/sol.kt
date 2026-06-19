class Solution {
    fun pacificAtlantic(heights: Array<IntArray>): List<List<Int>> {
        if (heights.isEmpty()) return emptyList()
        val m = heights.size
        val n = heights[0].size
        val directions = arrayOf(intArrayOf(1,0), intArrayOf(-1,0), intArrayOf(0,1), intArrayOf(0,-1))
        
        val pacific = Array(m) { BooleanArray(n) }
        val atlantic = Array(m) { BooleanArray(n) }
        
        fun dfs(i: Int, j: Int, visited: Array<BooleanArray>) {
            visited[i][j] = true
            for ((dx, dy) in directions) {
                val x = i + dx
                val y = j + dy
                if (x in 0 until m && y in 0 until n && !visited[x][y] && heights[x][y] >= heights[i][j]) {
                    dfs(x, y, visited)
                }
            }
        }
        
        for (j in 0 until n) dfs(0, j, pacific)
        for (i in 0 until m) dfs(i, 0, pacific)
        for (j in 0 until n) dfs(m-1, j, atlantic)
        for (i in 0 until m) dfs(i, n-1, atlantic)
        
        val result = mutableListOf<List<Int>>()
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (pacific[i][j] && atlantic[i][j]) {
                    result.add(listOf(i, j))
                }
            }
        }
        return result
    }
}
