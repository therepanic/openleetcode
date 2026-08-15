class Solution {
    fun checkWays(pairs: Array<IntArray>): Int {
        val graph = mutableMapOf<Int, MutableSet<Int>>()
        for (p in pairs) {
            graph.getOrPut(p[0]) { mutableSetOf() }.add(p[1])
            graph.getOrPut(p[1]) { mutableSetOf() }.add(p[0])
        }
        if (graph.isEmpty()) return 0
        val root = graph.maxBy { it.value.size }!!.key
        if (graph[root]!!.size != graph.size - 1) return 0

        var ans = 1
        for ((node, neighbors) in graph) {
            if (node == root) continue
            val parents = neighbors.filter { graph[it]!!.size >= neighbors.size }
            if (parents.isEmpty()) return 0
            val parent = parents.minBy { graph[it]!!.size }
            val union = graph[parent]!! + parent
            if (!union.containsAll(neighbors)) return 0
            if (neighbors.size == graph[parent]!!.size) ans = 2
        }
        return ans
    }
}
