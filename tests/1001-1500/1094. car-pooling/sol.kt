import java.util.PriorityQueue

class Solution {
    fun carPooling(trips: Array<IntArray>, capacity: Int): Boolean {
        trips.sortBy { it[1] }
        val heap = PriorityQueue<IntArray>(compareBy { it[0] })
        var currentPassengers = 0
        for (trip in trips) {
            val num = trip[0]
            val src = trip[1]
            val dest = trip[2]
            while (heap.isNotEmpty() && heap.peek()[0] <= src) {
                currentPassengers -= heap.poll()[1]
            }
            if (currentPassengers + num > capacity) {
                return false
            }
            currentPassengers += num
            heap.offer(intArrayOf(dest, num))
        }
        return true
    }
}
