class Solution {
    fun minCost(maxTime: Int, edges: Array<IntArray>, passingFees: IntArray): Int {
        val n = passingFees.size
        val graph = Array(n) { mutableListOf<Pair<Int, Int>>() }
        for (e in edges) {
            graph[e[0]].add(e[1] to e[2])
            graph[e[1]].add(e[0] to e[2])
        }
        val times = IntArray(n) { maxTime + 1 }
        val costs = IntArray(n) { Int.MAX_VALUE }
        times[0] = 0
        costs[0] = passingFees[0]
        val pq = java.util.PriorityQueue<Triple<Int, Int, Int>>(compareBy({ it.first }, { it.second }))
        pq.add(Triple(passingFees[0], 0, 0))
        while (pq.isNotEmpty()) {
            val (cost, time, city) = pq.poll()
            if (city == n - 1) return cost
            for ((nxt, t) in graph[city]) {
                val nt = time + t
                if (nt > maxTime) continue
                val nc = cost + passingFees[nxt]
                if (nc < costs[nxt] || nt < times[nxt]) {
                    costs[nxt] = nc
                    times[nxt] = nt
                    pq.add(Triple(nc, nt, nxt))
                }
            }
        }
        return -1
    }
}
