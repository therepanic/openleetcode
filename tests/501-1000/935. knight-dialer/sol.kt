class Solution {
    fun knightDialer(n: Int): Int {
        if (n == 1) {
            return 10
        }
        
        var dp = IntArray(10) { 1 }
        val mapping = arrayOf(
            intArrayOf(4, 6),
            intArrayOf(6, 8),
            intArrayOf(7, 9),
            intArrayOf(4, 8),
            intArrayOf(0, 3, 9),
            intArrayOf(),
            intArrayOf(0, 1, 7),
            intArrayOf(2, 6),
            intArrayOf(1, 3),
            intArrayOf(2, 4)
        )
        
        val MOD = 1000000007
        
        repeat(n - 1) {
            val newDp = IntArray(10)
            for (i in 0 until 10) {
                for (digit in mapping[i]) {
                    newDp[digit] = (newDp[digit] + dp[i]) % MOD
                }
            }
            dp = newDp
        }
        
        return dp.fold(0) { acc, value -> (acc + value) % MOD }
    }
}
