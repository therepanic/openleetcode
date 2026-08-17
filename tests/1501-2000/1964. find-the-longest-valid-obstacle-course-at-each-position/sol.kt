class Solution {
    fun longestObstacleCourseAtEachPosition(obstacles: IntArray): IntArray {
        val tails = mutableListOf<Int>()
        val res = IntArray(obstacles.size)
        for (i in obstacles.indices) {
            val x = obstacles[i]
            val idx = upperBound(tails, x)
            res[i] = idx + 1
            if (idx == tails.size) {
                tails.add(x)
            } else {
                tails[idx] = x
            }
        }
        return res
    }
    
    private fun upperBound(list: List<Int>, target: Int): Int {
        var lo = 0
        var hi = list.size
        while (lo < hi) {
            val mid = lo + (hi - lo) / 2
            if (list[mid] <= target) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo
    }
}
