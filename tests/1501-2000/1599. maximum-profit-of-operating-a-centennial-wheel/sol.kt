class Solution {
    fun minOperationsMaxProfit(customers: IntArray, boardingCost: Int, runningCost: Int): Int {
        var wait = 0
        var profit = 0
        var maxProfit = 0
        var ans = -1
        var i = 0
        var rotation = 0

        while (i < customers.size || wait > 0) {
            if (i < customers.size) {
                wait += customers[i]
            }
            val boarded = minOf(4, wait)
            wait -= boarded

            rotation++
            profit += boarded * boardingCost - runningCost

            if (profit > maxProfit) {
                maxProfit = profit
                ans = rotation
            }

            i++
        }

        return ans
    }
}
