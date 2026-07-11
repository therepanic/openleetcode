class Solution {
    fun maxDistToClosest(seats: IntArray): Int {
        val s = seats.joinToString("")
        val parts = s.split("1")
        val max = parts.maxOfOrNull { it.length } ?: 0
        return maxOf(parts.first().length, (max + 1) / 2, parts.last().length)
    }
}
