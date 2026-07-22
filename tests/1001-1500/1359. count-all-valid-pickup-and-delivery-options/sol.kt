class Solution {
    fun countOrders(n: Int): Int {
        val MOD = 1000000007
        var count = 1L
        for (i in 2..n) {
            count = (count * (2L * i - 1) * i) % MOD
        }
        return count.toInt()
    }
}
