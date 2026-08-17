class Solution {
    fun firstDayBeenInAllRooms(nextVisit: IntArray): Int {
        val MOD = 1_000_000_007
        val n = nextVisit.size
        val dp = LongArray(n)

        for (i in 1 until n) {
            dp[i] = (2 * dp[i-1] - dp[nextVisit[i-1]] + 2 + MOD) % MOD
        }
        
        return dp[n-1].toInt()
    }
}
