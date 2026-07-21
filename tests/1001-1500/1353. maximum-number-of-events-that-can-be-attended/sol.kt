class Solution {
    fun maxEvents(events: Array<IntArray>): Int {
        events.sortBy { it[0] }
        val minHeap = java.util.PriorityQueue<Int>()
        var day = 0
        var i = 0
        val n = events.size
        var result = 0
        
        while (minHeap.isNotEmpty() || i < n) {
            if (minHeap.isEmpty()) {
                day = events[i][0]
            }
            while (i < n && events[i][0] <= day) {
                minHeap.offer(events[i][1])
                i++
            }
            minHeap.poll()
            result++
            day++
            while (minHeap.isNotEmpty() && minHeap.peek() < day) {
                minHeap.poll()
            }
        }
        return result
    }
}
