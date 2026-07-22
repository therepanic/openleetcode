class Solution {
    fun closestDivisors(num: Int): IntArray {
        val start = Math.sqrt((num + 2).toDouble()).toInt()
        for (d in start downTo 1) {
            if ((num + 1) % d == 0) {
                return intArrayOf(d, (num + 1) / d)
            }
            if ((num + 2) % d == 0) {
                return intArrayOf(d, (num + 2) / d)
            }
        }
        return intArrayOf()
    }
}
