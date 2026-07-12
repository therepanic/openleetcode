class Solution {
    fun shortestAlternatingPaths(n: Int, redEdges: Array<IntArray>, blueEdges: Array<IntArray>): IntArray {
        val ans = IntArray(n) { -1 }
        val graph = Array(n) { mutableListOf<Pair<Int, Int>>() }
        val q: java.util.Queue<Pair<Int, Int>> = java.util.LinkedList()
        q.offer(Pair(0, 0)) // (node, prevColor): 0-init, 1-red, 2-blue
        
        for ((u, v) in redEdges) {
            graph[u].add(Pair(v, 1))
        }
        for ((u, v) in blueEdges) {
            graph[u].add(Pair(v, 2))
        }
        
        var step = 0
        while (q.isNotEmpty()) {
            repeat(q.size) {
                val (u, prevColor) = q.poll()
                if (ans[u] == -1) {
                    ans[u] = step
                }
                val neighbors = graph[u]
                for (i in neighbors.indices) {
                    val (v, edgeColor) = neighbors[i]
                    if (v == -1 || edgeColor == prevColor) continue
                    q.offer(Pair(v, edgeColor))
                    neighbors[i] = Pair(-1, edgeColor)
                }
            }
            step++
        }
        return ans
    }
}
