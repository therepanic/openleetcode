import java.util.*

class Solution {
    fun findCheapestPrice(n: Int, flights: Array<IntArray>, src: Int, dst: Int, k: Int): Int {
        val matrix = mutableMapOf<Int, MutableList<Pair<Int, Int>>>()
        for (i in 0 until n) {
            matrix[i] = mutableListOf()
        }
        for (flight in flights) {
            val u = flight[0]
            val v = flight[1]
            val w = flight[2]
            matrix[u]!!.add(Pair(v, w))
        }

        val distance = IntArray(n) { Int.MAX_VALUE }
        distance[src] = 0

        val queue: Queue<Pair<Int, Int>> = LinkedList()
        queue.offer(Pair(src, 0))
        var steps = 0

        while (queue.isNotEmpty()) {
            val level = queue.size
            if (steps == k + 1) {
                break
            }
            steps++

            repeat(level) {
                val (node, dist) = queue.poll()
                for ((v, w) in matrix[node]!!) {
                    if (w + dist < distance[v]) {
                        distance[v] = w + dist
                        queue.offer(Pair(v, dist + w))
                    }
                }
            }
        }

        return if (distance[dst] == Int.MAX_VALUE) -1 else distance[dst]
    }
}
