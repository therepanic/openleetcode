class Solution {
    fun minAreaRect(points: Array<IntArray>): Int {
        val cols = mutableMapOf<Int, MutableList<Int>>()
        for (point in points) {
            val x = point[0]
            val y = point[1]
            cols.getOrPut(x) { mutableListOf() }.add(y)
        }
        
        val lastX = mutableMapOf<Pair<Int, Int>, Int>()
        var best = Int.MAX_VALUE
        val sortedX = cols.keys.sorted()
        
        for (x in sortedX) {
            val ys = cols[x]!!.sorted()
            for (i in ys.indices) {
                for (j in i + 1 until ys.size) {
                    val pair = Pair(ys[i], ys[j])
                    if (pair in lastX) {
                        val area = (x - lastX[pair]!!) * (ys[j] - ys[i])
                        best = minOf(best, area)
                    }
                    lastX[pair] = x
                }
            }
        }
        return if (best == Int.MAX_VALUE) 0 else best
    }
}
