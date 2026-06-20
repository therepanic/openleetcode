class Solution {
    fun countNumbersWithUniqueDigits(n: Int): Int {
        if (n == 0) return 1
        if (n == 1) return 10
        var result = 10
        var current = 9
        for (i in 2..n) {
            current *= (10 - (i - 1))
            result += current
        }
        return result
    }
}
