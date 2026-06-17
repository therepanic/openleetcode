class Solution {
    fun maxProfit(prices: IntArray): Int {
        var a = Int.MIN_VALUE
        var b = 0
        var c = 0
        for (p in prices) {
            val newA = maxOf(a, c - p)
            val newB = a + p
            val newC = maxOf(c, b)
            a = newA
            b = newB
            c = newC
        }
        return maxOf(b, c)
    }
}
