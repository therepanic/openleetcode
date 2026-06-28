class Solution {
    private lateinit var parent: IntArray
    private lateinit var rank: IntArray
    
    private fun find(u: Int): Int {
        if (parent[u] != u) {
            parent[u] = find(parent[u])
        }
        return parent[u]
    }
    
    private fun union(u: Int, v: Int): Boolean {
        val pu = find(u)
        val pv = find(v)
        if (pu == pv) return false
        when {
            rank[pu] < rank[pv] -> parent[pu] = pv
            rank[pv] < rank[pu] -> parent[pv] = pu
            else -> {
                parent[pu] = pv
                rank[pv]++
            }
        }
        return true
    }
    
    fun findRedundantDirectedConnection(edges: Array<IntArray>): IntArray {
        val n = edges.size
        parent = IntArray(n + 1) { it }
        rank = IntArray(n + 1)
        val parentArr = IntArray(n + 1)
        
        var candidate1: IntArray? = null
        var candidate2: IntArray? = null
        
        for (edge in edges) {
            val u = edge[0]
            val v = edge[1]
            if (parentArr[v] != 0) {
                candidate1 = intArrayOf(parentArr[v], v)
                candidate2 = intArrayOf(u, v)
                break
            }
            parentArr[v] = u
        }
        
        for (edge in edges) {
            val u = edge[0]
            val v = edge[1]
            if (candidate2 != null && u == candidate2[0] && v == candidate2[1]) {
                continue
            }
            if (!union(u, v)) {
                return candidate1 ?: intArrayOf(u, v)
            }
        }
        
        return candidate2!!
    }
}
