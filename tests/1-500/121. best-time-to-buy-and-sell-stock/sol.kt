class Solution {
    fun maxProfit(prices: IntArray): Int {
        var best = 0
        var minPrice = Int.MAX_VALUE
        for (price in prices) {
            minPrice = minOf(minPrice, price)
            best = maxOf(best, price - minPrice)
        }
        return best
    }
}
