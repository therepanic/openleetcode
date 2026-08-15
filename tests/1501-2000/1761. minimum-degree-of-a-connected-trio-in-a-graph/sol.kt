class Solution {
    fun minTrioDegree(n: Int, edges: Array<IntArray>): Int {
        val adj = Array(n+1) { IntArray(n+1) }
        val deg = IntArray(n+1)
        for (e in edges) {
            adj[e[0]][e[1]]=1
            adj[e[1]][e[0]]=1
            deg[e[0]]++
            deg[e[1]]++
        }
        var ans = Int.MAX_VALUE
        for (e in edges) {
            val u=e[0]; val v=e[1]
            for (w in 1..n) {
                if (adj[u][w]==1 && adj[v][w]==1) {
                    ans = minOf(ans, deg[u]+deg[v]+deg[w]-6)
                }
            }
        }
        return if (ans==Int.MAX_VALUE) -1 else ans
    }
}
