class Solution {
    fun countDigitOne(n: Int): Int {
        var count = 0L
        var factor = 1L
        while (factor <= n) {
            val lower = n.toLong() % factor
            val cur = (n.toLong() / factor) % 10
            val higher = n.toLong() / (factor * 10)
            if (cur == 0L) {
                count += higher * factor
            } else if (cur == 1L) {
                count += higher * factor + lower + 1
            } else {
                count += (higher + 1) * factor
            }
            factor *= 10
        }
        return count.toInt()
    }
}
