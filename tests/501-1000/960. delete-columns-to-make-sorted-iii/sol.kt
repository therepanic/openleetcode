class Solution {
    fun minDeletionSize(strs: Array<String>): Int {
        val m = strs[0].length
        val dp = IntArray(m) { 1 }
        
        for (i in 0 until m) {
            for (j in 0 until i) {
                if (strs.all { it[j] <= it[i] }) {
                    dp[i] = maxOf(dp[i], dp[j] + 1)
                }
            }
        }
        
        return m - dp.max()
    }
}
