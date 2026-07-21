class Solution {
    fun distanceBetweenBusStops(distance: IntArray, start: Int, destination: Int): Int {
        var s = start
        var d = destination
        if (d < s) {
            s = d.also { d = s }
        }
        val clockwise = (s until d).sumOf { distance[it] }
        val total = distance.sum()
        return minOf(clockwise, total - clockwise)
    }
}
