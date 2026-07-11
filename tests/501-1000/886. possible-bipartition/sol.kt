class Solution {
    fun possibleBipartition(n: Int, dislikes: Array<IntArray>): Boolean {
        val graph = mutableMapOf<Int, MutableList<Int>>()
        for (edge in dislikes) {
            val u = edge[0]
            val v = edge[1]
            graph.getOrPut(u) { mutableListOf() }.add(v)
            graph.getOrPut(v) { mutableListOf() }.add(u)
        }
        
        val color = IntArray(n + 1)
        
        for (node in 1..n) {
            if (color[node] != 0 || !graph.containsKey(node)) {
                continue
            }
            
            val queue = ArrayDeque<Int>()
            queue.add(node)
            color[node] = 1
            
            while (queue.isNotEmpty()) {
                val curr = queue.removeFirst()
                
                for (neighbor in graph[curr]!!) {
                    if (color[neighbor] == color[curr]) {
                        return false
                    }
                    
                    if (color[neighbor] == 0) {
                        color[neighbor] = -color[curr]
                        queue.add(neighbor)
                    }
                }
            }
        }
        
        return true
    }
}
