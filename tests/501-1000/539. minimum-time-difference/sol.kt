class Solution {
    fun findMinDifference(timePoints: List<String>): Int {
        val times = timePoints.map {
            val (h, m) = it.split(":").map(String::toInt)
            h * 60 + m
        }.sorted()
        var minDiff = Int.MAX_VALUE
        for (i in 1 until times.size) {
            minDiff = minOf(minDiff, times[i] - times[i - 1])
        }
        minDiff = minOf(minDiff, 1440 + times[0] - times[times.size - 1])
        return minDiff
    }
}
