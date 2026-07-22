class Solution {
    fun maxProbability(n: Int, edges: Array<IntArray>, succProb: DoubleArray, start_node: Int, end_node: Int): Double {
        val dist = DoubleArray(n) { 0.0 }
        dist[start_node] = 1.0
        
        for (k in 0 until n - 1) {
            var updated = false
            for (i in edges.indices) {
                val u = edges[i][0]
                val v = edges[i][1]
                if (dist[u] * succProb[i] > dist[v]) {
                    dist[v] = dist[u] * succProb[i]
                    updated = true
                }
                if (dist[v] * succProb[i] > dist[u]) {
                    dist[u] = dist[v] * succProb[i]
                    updated = true
                }
            }
            if (!updated) break
        }
        
        return dist[end_node]
    }
}
