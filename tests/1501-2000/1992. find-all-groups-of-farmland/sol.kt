class Solution {
    fun findFarmland(land: Array<IntArray>): Array<IntArray> {
        val n = land.size
        val m = land[0].size
        val visited = Array(n) { BooleanArray(m) }
        val directions = arrayOf(intArrayOf(-1,0), intArrayOf(0,1), intArrayOf(1,0), intArrayOf(0,-1))
        
        val maxr = IntArray(1)
        val maxc = IntArray(1)
        
        val res = mutableListOf<IntArray>()
        
        fun dfs(r: Int, c: Int) {
            visited[r][c] = true
            maxr[0] = maxOf(maxr[0], r)
            maxc[0] = maxOf(maxc[0], c)
            for (d in directions) {
                val nr = r + d[0]
                val nc = c + d[1]
                if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                    if (!visited[nr][nc] && land[nr][nc] == 1) {
                        dfs(nr, nc)
                    }
                }
            }
        }
        
        for (i in 0 until n) {
            for (j in 0 until m) {
                if (land[i][j] == 1 && !visited[i][j]) {
                    maxr[0] = i
                    maxc[0] = j
                    dfs(i, j)
                    res.add(intArrayOf(i, j, maxr[0], maxc[0]))
                }
            }
        }
        return res.toTypedArray()
    }
}
