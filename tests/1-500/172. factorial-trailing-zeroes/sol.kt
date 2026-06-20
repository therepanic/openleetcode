class Solution {
    fun trailingZeroes(n: Int): Int {
        var count = 0
        var divisor = 5L
        while (divisor <= n.toLong()) {
            count += (n / divisor).toInt()
            divisor *= 5
        }
        return count
    }
}
