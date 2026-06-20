class Solution {
    fun maxProfit(prices: IntArray): Int {
        if (prices.isEmpty()) {
            return 0
        }
        var buy1 = -prices[0]
        var sell1 = 0
        var buy2 = -prices[0]
        var sell2 = 0
        for (i in 1 until prices.size) {
            val price = prices[i]
            buy1 = maxOf(buy1, -price)
            sell1 = maxOf(sell1, buy1 + price)
            buy2 = maxOf(buy2, sell1 - price)
            sell2 = maxOf(sell2, buy2 + price)
        }
        return sell2
    }
}
