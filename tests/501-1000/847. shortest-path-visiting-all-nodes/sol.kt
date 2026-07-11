class Solution {
    fun shortestPathLength(graph: Array<IntArray>): Int {
        val n = graph.size
        if (n == 1) return 0
        
        val FULL = (1 shl n) - 1
        val visited = Array(n) { BooleanArray(1 shl n) }
        val q = java.util.LinkedList<Triple<Int, Int, Int>>()
        
        for (i in 0 until n) {
            val mask = 1 shl i
            q.offer(Triple(i, mask, 0))
            visited[i][mask] = true
        }
        
        while (q.isNotEmpty()) {
            val (node, mask, dist) = q.poll()
            
            if (mask == FULL) return dist
            
            for (nei in graph[node]) {
                val newMask = mask or (1 shl nei)
                
                if (!visited[nei][newMask]) {
                    visited[nei][newMask] = true
                    q.offer(Triple(nei, newMask, dist + 1))
                }
            }
        }
        
        return -1
    }
}
