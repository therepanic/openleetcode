class Solution {
    fun eatenApples(apples: IntArray, days: IntArray): Int {
        val pq = PriorityQueue<Pair<Int, Int>>(compareBy { it.first })
        val n = apples.size
        var res = 0
        var day = 0
        while (pq.isNotEmpty() || day < n) {
            if (day < n && apples[day] > 0) {
                pq.add(day + days[day] to apples[day])
            }
            while (pq.isNotEmpty() && pq.peek().first <= day) {
                pq.poll()
            }
            if (pq.isNotEmpty()) {
                val (expire, count) = pq.poll()
                res++
                if (count - 1 > 0) {
                    pq.add(expire to count - 1)
                }
            }
            day++
        }
        return res
    }
}
