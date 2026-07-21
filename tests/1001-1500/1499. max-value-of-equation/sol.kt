class Solution {
    fun findMaxValueOfEquation(points: Array<IntArray>, k: Int): Int {
        val window = ArrayDeque<IntArray>()
        var answer = Int.MIN_VALUE
        for (point in points) {
            val x = point[0]
            val y = point[1]
            while (window.isNotEmpty() && x - window.first()[1] > k) {
                window.removeFirst()
            }
            if (window.isNotEmpty()) {
                answer = maxOf(answer, x + y + window.first()[0])
            }
            val value = y - x
            while (window.isNotEmpty() && window.last()[0] <= value) {
                window.removeLast()
            }
            window.addLast(intArrayOf(value, x))
        }
        return answer
    }
}
