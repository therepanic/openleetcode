class Solution {
    fun maxIceCream(costs: IntArray, coins: Int): Int {
        var xMin = costs[0]
        var xMax = costs[0]
        for (x in costs) {
            xMin = minOf(xMin, x)
            xMax = maxOf(xMax, x)
        }
        val freq = IntArray(xMax + 1)
        for (x in costs) {
            freq[x]++
            xMin = minOf(xMin, x)
        }
        var cnt = 0
        var remaining = coins
        for (x in xMin..xMax) {
            val f = freq[x]
            if (f == 0) continue
            val buy = minOf(remaining / x, f)
            if (buy == 0) break
            cnt += buy
            remaining -= buy * x
        }
        return cnt
    }
}
