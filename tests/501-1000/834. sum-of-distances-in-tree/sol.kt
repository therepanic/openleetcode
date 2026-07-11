class Solution {
    fun sumOfDistancesInTree(n: Int, edges: Array<IntArray>): IntArray {
        val adj = Array(n) { mutableListOf<Int>() }
        for ((u, v) in edges) {
            adj[u].add(v)
            adj[v].add(u)
        }
        
        val count = IntArray(n) { 1 }
        val ans = IntArray(n)
        
        fun dfsIn(node: Int, parent: Int) {
            for (child in adj[node]) {
                if (child != parent) {
                    dfsIn(child, node)
                    count[node] += count[child]
                    ans[node] += ans[child] + count[child]
                }
            }
        }
        
        fun dfsOut(node: Int, parent: Int) {
            for (child in adj[node]) {
                if (child != parent) {
                    ans[child] = ans[node] - count[child] + (n - count[child])
                    dfsOut(child, node)
                }
            }
        }
        
        dfsIn(0, -1)
        dfsOut(0, -1)
        return ans
    }
}
