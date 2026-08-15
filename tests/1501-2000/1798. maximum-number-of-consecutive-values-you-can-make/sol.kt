class Solution {
    fun getMaximumConsecutive(coins: IntArray): Int {
        coins.sort()
        var maxConsecutive = 0
        
        for (coin in coins) {
            if (coin > maxConsecutive + 1) break
            maxConsecutive += coin
        }
        
        return maxConsecutive + 1
    }
}
