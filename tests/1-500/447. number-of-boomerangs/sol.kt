class Solution {
    fun numberOfBoomerangs(points: Array<IntArray>): Int {
        var result = 0
        for (p in points) {
            val distances = HashMap<Int, Int>()
            for (q in points) {
                val d = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1])
                distances[d] = distances.getOrDefault(d, 0) + 1
            }
            for (count in distances.values) {
                result += count * (count - 1)
            }
        }
        return result
    }
}
