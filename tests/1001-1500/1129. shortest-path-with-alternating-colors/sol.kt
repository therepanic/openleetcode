class Solution {
    fun shortestAlternatingPaths(n: Int, redEdges: Array<IntArray>, blueEdges: Array<IntArray>): IntArray {
        val ans = IntArray(n) { -1 }
        val graph = Array(n) { mutableListOf<IntArray>() }
        
        for (e in redEdges) {
            graph[e[0]].add(intArrayOf(e[1], 1)) // 1 = red
        }
        for (e in blueEdges) {
            graph[e[0]].add(intArrayOf(e[1], 2)) // 2 = blue
        }
        
        val q: java.util.Queue<IntArray> = java.util.LinkedList()
        q.offer(intArrayOf(0, 0)) // [node, prevColor]: 0=init
        
        var step = 0
        while (q.isNotEmpty()) {
            val size = q.size
            repeat(size) {
                val cur = q.poll()
                val u = cur[0]
                val prevColor = cur[1]
                if (ans[u] == -1) {
                    ans[u] = step
                }
                val neighbors = graph[u]
                for (i in neighbors.indices) {
                    val (v, edgeColor) = neighbors[i]
                    if (v == -1 || edgeColor == prevColor) continue
                    q.offer(intArrayOf(v, edgeColor))
                    neighbors[i] = intArrayOf(-1, edgeColor)
                }
            }
            step++
        }
        return ans
    }
}
