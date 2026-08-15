class Solution {
    fun busiestServers(k: Int, arrival: IntArray, load: IntArray): List<Int> {
        val available = java.util.PriorityQueue<Int>()
        for (i in 0 until k) available.add(i)
        val busy = java.util.PriorityQueue<Pair<Int, Int>>(compareBy { it.first })
        val res = IntArray(k)
        for (i in arrival.indices) {
            val a = arrival[i]
            while (busy.isNotEmpty() && busy.peek().first <= a) {
                val x = busy.poll().second
                available.add(i + ((x - i) % k + k) % k)
            }
            if (available.isNotEmpty()) {
                val j = available.poll() % k
                busy.add(Pair(a + load[i], j))
                res[j]++
            }
        }
        val max = res.max() ?: 0
        return (0 until k).filter { res[it] == max }
    }
}
