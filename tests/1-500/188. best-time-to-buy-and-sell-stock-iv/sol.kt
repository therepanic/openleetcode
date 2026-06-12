class Solution {
    fun maxProfit(k: Int, prices: IntArray): Int {
        val n = prices.size
        if (k == 0 || n < 2) return 0
        if (k >= n / 2) {
            var profit = 0
            var i = 1
            while (i < n) {
                if (prices[i] > prices[i - 1]) profit += prices[i] - prices[i - 1]
                i++
            }
            return profit
        }

        val hold = IntArray(k + 1) { Int.MIN_VALUE / 4 }
        val free = IntArray(k + 1)
        var i = 0
        while (i < n) {
            val price = prices[i]
            var t = 1
            while (t <= k) {
                val buy = free[t - 1] - price
                if (buy > hold[t]) hold[t] = buy
                val sell = hold[t] + price
                if (sell > free[t]) free[t] = sell
                t++
            }
            i++
        }
        var best = 0
        for (value in free) if (value > best) best = value
        return best
    }
}
