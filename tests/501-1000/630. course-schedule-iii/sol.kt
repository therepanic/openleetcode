class Solution {
    fun scheduleCourse(courses: Array<IntArray>): Int {
        courses.sortWith(compareBy({ it[1] }, { it[0] }))
        val heap = java.util.PriorityQueue<Int>(compareByDescending { it })
        var days = 0
        for (course in courses) {
            val duration = course[0]
            val last = course[1]
            days += duration
            heap.offer(duration)
            if (days > last) {
                val top = heap.poll()
                days -= top
            }
        }
        return heap.size
    }
}
