class Solution {
    fun minTime(n: Int, edges: Array<IntArray>, hasApple: List<Boolean>): Int {
        val adj = List(n) { mutableListOf<Int>() }
        val degree = IntArray(n)

        for ((u, v) in edges) {
            adj[u].add(v)
            adj[v].add(u)
            degree[u]++
            degree[v]++
        }

        val q = ArrayDeque<Int>()
        for (i in 1 until n) {
            if (degree[i] == 1 && !hasApple[i]) {
                q.add(i)
            }
        }

        val keep = BooleanArray(n) { true }

        while (q.isNotEmpty()) {
            val u = q.removeFirst()
            keep[u] = false

            for (v in adj[u]) {
                degree[v]--
                if (v != 0 && keep[v] && !hasApple[v] && degree[v] == 1) {
                    q.add(v)
                }
            }
        }

        val activeNodes = keep.count { it }
        return maxOf(0, (activeNodes - 1) * 2)
    }

    // The local harness materializes boolean arrays for this parameter.
    fun minTime(n: Int, edges: Array<IntArray>, hasApple: BooleanArray): Int {
        return minTime(n, edges, hasApple.toList())
    }
}
