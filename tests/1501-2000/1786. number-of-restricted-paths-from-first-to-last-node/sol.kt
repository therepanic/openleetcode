class Solution {
    fun countRestrictedPaths(n: Int, edges: Array<IntArray>): Int {
        val mod = 1_000_000_007
        val graph = Array(n + 1) { mutableListOf<Pair<Int, Int>>() }
        for (e in edges) {
            graph[e[0]].add(e[1] to e[2])
            graph[e[1]].add(e[0] to e[2])
        }

        val dist = IntArray(n + 1) { Int.MAX_VALUE }
        dist[n] = 0
        val pq = PriorityQueue<Pair<Int, Int>>(compareBy { it.first })
        pq.add(0 to n)
        while (pq.isNotEmpty()) {
            val (d, node) = pq.poll()
            if (d > dist[node]) continue
            for ((next, w) in graph[node]) {
                val nd = d + w
                if (nd < dist[next]) {
                    dist[next] = nd
                    pq.add(nd to next)
                }
            }
        }

        val dp = LongArray(n + 1)
        dp[n] = 1
        val nodes = (1..n).sortedBy { dist[it] }
        for (u in nodes) {
            for ((v, _) in graph[u]) {
                if (dist[u] > dist[v]) {
                    dp[u] = (dp[u] + dp[v]) % mod
                }
            }
        }
        return (dp[1] % mod).toInt()
    }
}
