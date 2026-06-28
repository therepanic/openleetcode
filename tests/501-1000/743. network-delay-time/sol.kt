class Solution {
    fun networkDelayTime(times: Array<IntArray>, n: Int, k: Int): Int {
        val adj = Array(n + 1) { mutableListOf<IntArray>() }
        for (t in times) {
            adj[t[0]].add(intArrayOf(t[1], t[2]))
        }
        
        val dist = IntArray(n + 1) { Int.MAX_VALUE }
        dist[k] = 0
        
        val pq = java.util.PriorityQueue<IntArray>(compareBy { it[0] })
        pq.offer(intArrayOf(0, k))
        
        while (pq.isNotEmpty()) {
            val cur = pq.poll()
            val dis = cur[0]
            val node = cur[1]
            if (dis > dist[node]) continue
            for (next in adj[node]) {
                val adjNode = next[0]
                val wt = next[1]
                if (dis + wt < dist[adjNode]) {
                    dist[adjNode] = dis + wt
                    pq.offer(intArrayOf(dist[adjNode], adjNode))
                }
            }
        }
        
        var ans = 0
        for (i in 1..n) {
            if (dist[i] == Int.MAX_VALUE) return -1
            ans = maxOf(ans, dist[i])
        }
        return ans
    }
}
