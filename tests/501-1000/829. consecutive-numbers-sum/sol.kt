class Solution {
    fun consecutiveNumbersSum(n: Int): Int {
        val maxSequenceLength = ((Math.sqrt(1.0 + 8.0 * n) - 1) / 2).toInt()
        var c = 0
        for (i in 2..maxSequenceLength) {
            if (i % 2 == 1 && n % i == 0) {
                c++
            } else if (i % 2 == 0 && n % i == i / 2) {
                c++
            }
        }
        return c + 1
    }
}
