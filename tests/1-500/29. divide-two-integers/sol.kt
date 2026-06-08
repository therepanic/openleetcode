class Solution {
    fun divide(dividend: Int, divisor: Int): Int {
        if (dividend == Int.MIN_VALUE && divisor == -1) return Int.MAX_VALUE
        val q = dividend.toLong() / divisor.toLong()
        if (q < Int.MIN_VALUE.toLong()) return Int.MIN_VALUE
        if (q > Int.MAX_VALUE.toLong()) return Int.MAX_VALUE
        return q.toInt()
    }
}
