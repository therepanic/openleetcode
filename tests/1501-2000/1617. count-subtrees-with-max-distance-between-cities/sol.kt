class Solution {
    fun countSubgraphsForEachDiameter(n: Int, edges: Array<IntArray>): IntArray {
        val graph = Array(n) { mutableListOf<Int>() }
        for (e in edges) {
            val u = e[0] - 1
            val v = e[1] - 1
            graph[u].add(v)
            graph[v].add(u)
        }
        val answer = IntArray(n - 1)
        for (mask in 1 until (1 shl n)) {
            if (Integer.bitCount(mask) <= 1) continue
            val b = mask and -mask
            val s = Integer.numberOfTrailingZeros(b)
            val seen = BooleanArray(n)
            seen[s] = true
            var cnt = 1
            val q = ArrayDeque<Int>()
            q.add(s)
            while (q.isNotEmpty()) {
                val u = q.removeFirst()
                for (v in graph[u]) {
                    if ((mask shr v) and 1 == 1 && !seen[v]) {
                        seen[v] = true
                        cnt++
                        q.add(v)
                    }
                }
            }
            if (cnt != Integer.bitCount(mask)) continue
            val (a, _) = bfs(mask, s, graph)
            val (_, d) = bfs(mask, a, graph)
            if (d >= 1) answer[d - 1]++
        }
        return answer
    }
    
    private fun bfs(mask: Int, start: Int, graph: Array<MutableList<Int>>): Pair<Int, Int> {
        val n = graph.size
        val dist = IntArray(n) { -1 }
        dist[start] = 0
        val q = ArrayDeque<Int>()
        q.add(start)
        var last = start
        while (q.isNotEmpty()) {
            val u = q.removeFirst()
            last = u
            for (v in graph[u]) {
                if ((mask shr v) and 1 == 1 && dist[v] == -1) {
                    dist[v] = dist[u] + 1
                    q.add(v)
                }
            }
        }
        return last to dist[last]
    }
}
