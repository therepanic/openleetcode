class Solution {
    fun removeStones(stones: Array<IntArray>): Int {
        val n = stones.size
        val matrix = Array(n) { mutableListOf<Int>() }
        
        for (i in 0 until n) {
            for (j in i + 1 until n) {
                if (stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1]) {
                    matrix[i].add(j)
                    matrix[j].add(i)
                }
            }
        }
        
        val visited = BooleanArray(n)
        var components = 0
        
        fun dfs(idx: Int) {
            visited[idx] = true
            for (nei in matrix[idx]) {
                if (!visited[nei]) {
                    dfs(nei)
                }
            }
        }
        
        for (i in 0 until n) {
            if (!visited[i]) {
                components++
                dfs(i)
            }
        }
        
        return n - components
    }
}
