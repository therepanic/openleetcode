class Solution {
    fun eventualSafeNodes(graph: Array<IntArray>): List<Int> {
        val n = graph.size
        val state = IntArray(n) // 0: unvisited, 1: visiting, 2: safe
        val safe = mutableListOf<Int>()
        
        fun dfs(node: Int): Boolean {
            if (state[node] > 0) {
                return state[node] == 2
            }
            
            state[node] = 1
            
            for (neighbor in graph[node]) {
                if (state[neighbor] == 1 || !dfs(neighbor)) {
                    return false
                }
            }
            
            state[node] = 2
            return true
        }
        
        for (i in 0 until n) {
            if (dfs(i)) {
                safe.add(i)
            }
        }
        
        return safe
    }
}
