class Solution {
    fun isBipartite(graph: Array<IntArray>): Boolean {
        val N = graph.size
        val colors = IntArray(N) { -1 }
        
        for (u in 0 until N) {
            if (colors[u] == -1) {
                if (!checkBipartite(u, 0, colors, graph)) {
                    return false
                }
            }
        }
        return true
    }
    
    private fun checkBipartite(u: Int, currColor: Int, colors: IntArray, graph: Array<IntArray>): Boolean {
        colors[u] = currColor
        for (v in graph[u]) {
            if (colors[v] == -1) {
                if (!checkBipartite(v, 1 - currColor, colors, graph)) {
                    return false
                }
            } else {
                if (colors[v] == currColor) {
                    return false
                }
            }
        }
        return true
    }
}
