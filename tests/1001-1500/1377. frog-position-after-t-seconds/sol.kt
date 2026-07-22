class Solution {
    fun frogPosition(n: Int, edges: Array<IntArray>, t: Int, target: Int): Double {
        val neighbors = mutableMapOf<Int, MutableSet<Int>>()
        for (i in 1..n) {
            neighbors[i] = mutableSetOf()
        }
        for (edge in edges) {
            val a = edge[0]
            val b = edge[1]
            neighbors[a]!!.add(b)
            neighbors[b]!!.add(a)
        }
        
        fun dfs(vertex: Int, chance: Double, elapsed: Int, visited: MutableSet<Int>): Double {
            if (elapsed == t) {
                return if (vertex == target) chance else 0.0
            }
            visited.add(vertex)
            val choices = neighbors[vertex]!!.subtract(visited)
            
            if (choices.isEmpty()) {
                return dfs(vertex, chance, elapsed + 1, visited)
            } else {
                for (child in choices) {
                    val result = dfs(child, chance / choices.size, elapsed + 1, visited)
                    if (result > 0) return result
                }
            }
            return 0.0
        }
        
        return dfs(1, 1.0, 0, mutableSetOf())
    }
}
