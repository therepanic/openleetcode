import java.util.*

class Solution {
    fun countPaths(n: Int, roads: Array<IntArray>): Int {
        val graph = Array(n) { mutableListOf<Pair<Int, Int>>() }
        for (road in roads) {
            graph[road[0]].add(Pair(road[1], road[2]))
            graph[road[1]].add(Pair(road[0], road[2]))
        }
        
        val dist = LongArray(n) { Long.MAX_VALUE }
        val ways = IntArray(n)
        dist[0] = 0
        ways[0] = 1
        
        val pq = PriorityQueue<Pair<Long, Int>>(compareBy { it.first })
        pq.add(Pair(0L, 0))
        
        val MOD = 1_000_000_007
        
        while (pq.isNotEmpty()) {
            val (d, node) = pq.poll()
            
            if (d > dist[node]) continue
            
            for ((neighbor, time) in graph[node]) {
                if (dist[node] + time < dist[neighbor]) {
                    dist[neighbor] = dist[node] + time
                    ways[neighbor] = ways[node]
                    pq.add(Pair(dist[neighbor], neighbor))
                } else if (dist[node] + time == dist[neighbor]) {
                    ways[neighbor] = (ways[neighbor] + ways[node]) % MOD
                }
            }
        }
        
        return ways[n-1]
    }
}
