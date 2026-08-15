import java.util.PriorityQueue
import java.util.HashMap

class Solution {
    fun minCostConnectPoints(points: Array<IntArray>): Int {
        val n = points.size
        var minCost = 0
        val visited = BooleanArray(n)
        val pq = PriorityQueue<Pair<Int, Int>>(compareBy { it.first })
        pq.offer(Pair(0, 0))
        val cache = HashMap<Int, Int>()
        cache[0] = 0
        
        while (pq.isNotEmpty()) {
            val (cost, u) = pq.poll()
            if (visited[u]) continue
            visited[u] = true
            minCost += cost
            for (v in 0 until n) {
                if (!visited[v]) {
                    val dist = Math.abs(points[u][0] - points[v][0]) + Math.abs(points[u][1] - points[v][1])
                    if (dist < cache.getOrDefault(v, Int.MAX_VALUE)) {
                        cache[v] = dist
                        pq.offer(Pair(dist, v))
                    }
                }
            }
        }
        return minCost
    }
}
