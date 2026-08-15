import java.util.*

class Solution {
    fun minInterval(intervals: Array<IntArray>, queries: IntArray): IntArray {
        intervals.sortBy { it[0] }
        val minHeap = PriorityQueue<IntArray>(compareBy { it[0] })
        val res = HashMap<Int, Int>()
        var i = 0
        val sortedQueries = queries.sorted()
        for (q in sortedQueries) {
            while (i < intervals.size && intervals[i][0] <= q) {
                val l = intervals[i][0]
                val r = intervals[i][1]
                minHeap.offer(intArrayOf(r - l + 1, r))
                i++
            }
            while (!minHeap.isEmpty() && minHeap.peek()[1] < q) {
                minHeap.poll()
            }
            res[q] = if (minHeap.isEmpty()) -1 else minHeap.peek()[0]
        }
        return IntArray(queries.size) { res[queries[it]]!! }
    }
}
