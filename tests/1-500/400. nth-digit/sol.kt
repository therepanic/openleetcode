class Solution {
    fun findNthDigit(n: Int): Int {
        var n = n
        var i = 1
        var count: Long = 9
        var start: Long = 1

        while (n > i * count) {
            n -= (i * count).toInt()
            i++
            count *= 10
            start *= 10
        }

        val number = start + (n - 1) / i
        return number.toString()[(n - 1) % i] - '0'
    }
}
