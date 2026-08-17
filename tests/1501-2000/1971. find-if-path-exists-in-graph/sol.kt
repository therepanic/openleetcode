class Solution {
    fun validPath(n: Int, edges: Array<IntArray>, source: Int, destination: Int): Boolean {
        if (source == destination) return true
        val graph = HashMap<Int, MutableList<Int>>()
        for (edge in edges) {
            graph.getOrPut(edge[0]) { mutableListOf() }.add(edge[1])
            graph.getOrPut(edge[1]) { mutableListOf() }.add(edge[0])
        }
        val queue = ArrayDeque<Int>()
        val visited = HashSet<Int>()
        queue.add(source)
        visited.add(source)
        while (queue.isNotEmpty()) {
            val node = queue.removeFirst()
            if (node == destination) return true
            for (neighbor in graph[node] ?: emptyList()) {
                if (visited.add(neighbor)) {
                    queue.add(neighbor)
                }
            }
        }
        return false
    }
}
