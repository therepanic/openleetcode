class Solution {
    fun shoppingOffers(price: IntArray, special: Array<IntArray>, needs: IntArray): Int {
        val priceList = price.toList()
        val specialList = special.map { it.toList() }
        val needsList = needs.toList()
        val p = priceList.size
        val memo = mutableMapOf<List<Int>, Int>()
        
        fun dp(curr: List<Int>): Int {
            if (curr.all { it == 0 }) return 0
            memo[curr]?.let { return it }
            
            val n = curr.size
            var res = (0 until p).sumOf { curr[it] * price[it] }
            for (offer in special) {
                if ((0 until n).all { curr[it] >= offer[it] }) {
                    val newCurr = (0 until n).map { curr[it] - offer[it] }
                    res = minOf(res, offer.last() + dp(newCurr))
                }
            }
            memo[curr] = res
            return res
        }
        
        return dp(needsList)
    }
}
