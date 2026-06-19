class Solution {
    fun findPoisonedDuration(timeSeries: IntArray, duration: Int): Int {
        var totalSecs = 0
        var prev: Int? = null

        for (t in timeSeries) {
            totalSecs += duration

            if (prev != null && prev + duration > t) {
                totalSecs -= (prev + duration - t)
            }

            prev = t
        }

        return totalSecs
    }
}
