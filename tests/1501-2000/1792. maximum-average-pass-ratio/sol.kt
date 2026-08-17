import java.util.PriorityQueue
class Solution {
    fun maxAverageRatio(classes: Array<IntArray>, extraStudents: Int): Double {
        val pq = PriorityQueue<DoubleArray> { a, b -> b[0].compareTo(a[0]) }
        for (c in classes) {
            val gain = (c[0] + 1.0) / (c[1] + 1) - c[0].toDouble() / c[1]
            pq.offer(doubleArrayOf(gain, c[0].toDouble(), c[1].toDouble()))
        }
        repeat(extraStudents) {
            val top = pq.poll()
            var p = top[1]; var t = top[2]
            p++; t++
            val gain = (p + 1) / (t + 1) - p / t
            pq.offer(doubleArrayOf(gain, p, t))
        }
        var sum = 0.0
        for (item in pq) {
            sum += item[1] / item[2]
        }
        return sum / classes.size
    }
}
