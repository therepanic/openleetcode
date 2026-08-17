class Solution {
    fun countSubIslands(grid1: Array<IntArray>, grid2: Array<IntArray>): Int {
        val m = grid1.size
        val n = grid1[0].size
        var valid = booleanArrayOf(true)
        var res = 0
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (grid2[i][j] == 1) {
                    valid[0] = true
                    dfs(grid1, grid2, i, j, m, n, valid)
                    if (valid[0]) res++
                }
            }
        }
        return res
    }
    private fun dfs(grid1: Array<IntArray>, grid2: Array<IntArray>, i: Int, j: Int, m: Int, n: Int, valid: BooleanArray) {
        if (i < 0 || i >= m || j < 0 || j >= n) return
        if (grid2[i][j] == 0) return
        if (grid1[i][j] == 0) valid[0] = false
        grid2[i][j] = 0
        dfs(grid1, grid2, i+1, j, m, n, valid)
        dfs(grid1, grid2, i-1, j, m, n, valid)
        dfs(grid1, grid2, i, j+1, m, n, valid)
        dfs(grid1, grid2, i, j-1, m, n, valid)
    }
}
