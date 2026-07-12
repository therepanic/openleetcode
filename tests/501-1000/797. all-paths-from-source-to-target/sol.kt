class Solution {
    fun allPathsSourceTarget(graph: Array<IntArray>): List<List<Int>> {
        val result = mutableListOf<List<Int>>()
        val target = graph.size - 1
        
        val queue = ArrayDeque<Pair<Int, List<Int>>>()
        queue.add(Pair(0, listOf(0)))
        
        while (queue.isNotEmpty()) {
            val (node, path) = queue.removeFirst()
            
            if (node == target) {
                result.add(path)
                continue
            }
            
            for (neighbor in graph[node]) {
                queue.add(Pair(neighbor, path + neighbor))
            }
        }
        
        return result
    }
}
