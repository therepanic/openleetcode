class Solution {
    fun reachableNodes(edges: Array<IntArray>, maxMoves: Int, n: Int): Int {
        val graph = Array(n) { mutableListOf<IntArray>() }
        val dist = IntArray(n) { maxMoves + 1 }
        
        for (edge in edges) {
            val u = edge[0]
            val v = edge[1]
            val cnt = edge[2]
            graph[u].add(intArrayOf(v, cnt))
            graph[v].add(intArrayOf(u, cnt))
        }
        
        fun dijkstra(): Int {
            dist[0] = 0
            val minHeap = PriorityQueue<IntArray>(compareBy { it[0] })
            minHeap.offer(intArrayOf(0, 0))
            
            while (minHeap.isNotEmpty()) {
                val curr = minHeap.poll()
                val d = curr[0]
                val u = curr[1]
                
                if (dist[u] >= maxMoves) break
                
                for (neighbor in graph[u]) {
                    val v = neighbor[0]
                    val w = neighbor[1]
                    val newDist = d + w + 1
                    if (newDist < dist[v]) {
                        dist[v] = newDist
                        minHeap.offer(intArrayOf(newDist, v))
                    }
                }
            }
            
            return dist.count { it <= maxMoves }
        }
        
        val reachableNodes = dijkstra()
        var reachableSubnodes = 0
        
        for (edge in edges) {
            val u = edge[0]
            val v = edge[1]
            val cnt = edge[2]
            val a = if (dist[u] > maxMoves) 0 else minOf(maxMoves - dist[u], cnt)
            val b = if (dist[v] > maxMoves) 0 else minOf(maxMoves - dist[v], cnt)
            reachableSubnodes += minOf(a + b, cnt)
        }
        
        return reachableNodes + reachableSubnodes
    }
}
