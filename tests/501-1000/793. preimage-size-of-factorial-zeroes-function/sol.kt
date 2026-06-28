class Solution {
    fun preimageSizeFZF(k: Int): Int {
        fun trailingZeroes(n: Long): Long {
            var count = 0L
            var power = 5L
            while (power <= n) {
                count += n / power
                power *= 5
            }
            return count
        }

        var start = 4L * k
        while (true) {
            val H = trailingZeroes(start)
            if (H == k.toLong()) {
                return 5
            }
            if (H > k.toLong()) {
                break
            }
            start++
        }
        return 0
    }
}
