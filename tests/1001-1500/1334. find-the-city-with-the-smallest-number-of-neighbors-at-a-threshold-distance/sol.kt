class Solution {
    fun findTheCity(n: Int, edges: Array<IntArray>, distanceThreshold: Int): Int {
        val INF = Int.MAX_VALUE / 2
        val matrix = Array(n) { IntArray(n) { INF } }
        
        for (i in 0 until n) {
            matrix[i][i] = 0
        }
        
        for (edge in edges) {
            val u = edge[0]
            val v = edge[1]
            val w = edge[2]
            matrix[u][v] = w
            matrix[v][u] = w
        }
        
        for (via in 0 until n) {
            for (i in 0 until n) {
                for (j in 0 until n) {
                    if (matrix[i][via] + matrix[via][j] < matrix[i][j]) {
                        matrix[i][j] = matrix[i][via] + matrix[via][j]
                    }
                }
            }
        }
        
        var minReachable = n
        var ans = -1
        
        for (i in 0 until n) {
            var count = 0
            for (j in 0 until n) {
                if (matrix[i][j] <= distanceThreshold) {
                    count++
                }
            }
            if (count <= minReachable) {
                minReachable = count
                ans = i
            }
        }
        
        return ans
    }
}
