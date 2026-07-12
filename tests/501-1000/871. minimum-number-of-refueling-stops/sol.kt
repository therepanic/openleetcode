class Solution {
    fun minRefuelStops(target: Int, startFuel: Int, stations: Array<IntArray>): Int {
        val heap = java.util.PriorityQueue<Int>(compareByDescending { it })
        var fuel = startFuel
        var count = 0
        var i = 0
        val extended = stations + arrayOf(intArrayOf(target, 0))
        while (i < extended.size) {
            if (fuel >= target) return count
            while (i < extended.size && extended[i][0] <= fuel) {
                heap.offer(extended[i][1])
                i++
            }
            if (heap.isEmpty()) return -1
            fuel += heap.poll()
            count++
        }
        return -1
    }
}
