class Solution {
    fun finalPrices(prices: IntArray): IntArray {
        val stack = ArrayDeque<Int>()
        for (i in prices.indices) {
            while (stack.isNotEmpty() && prices[stack.last()] >= prices[i]) {
                val index = stack.removeLast()
                prices[index] -= prices[i]
            }
            stack.addLast(i)
        }
        return prices
    }
}
