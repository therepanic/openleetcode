class Solution {
    fun eliminateMaximum(dist: IntArray, speed: IntArray): Int {
        val arrival = IntArray(dist.size) { i -> (dist[i] + speed[i] - 1) / speed[i] }
        arrival.sort()
        for (minute in arrival.indices) {
            if (arrival[minute] <= minute) {
                return minute
            }
        }
        return arrival.size
    }
}
