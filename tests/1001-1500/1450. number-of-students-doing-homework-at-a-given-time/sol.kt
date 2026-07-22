class Solution {
    fun busyStudent(startTime: IntArray, endTime: IntArray, queryTime: Int): Int {
        return startTime.indices.count { startTime[it] <= queryTime && queryTime <= endTime[it] }
    }
}
