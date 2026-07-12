class Solution {
    fun numMusicPlaylists(n: Int, goal: Int, k: Int): Int {
        val MOD = 1000000007
        val dp = Array(2) { IntArray(n + 1) }
        dp[0][0] = 1

        for (i in 1..goal) {
            dp[i % 2][0] = 0
            for (j in 1..minOf(i, n)) {
                dp[i % 2][j] = ((dp[(i - 1) % 2][j - 1].toLong() * (n - (j - 1))) % MOD).toInt()
                if (j > k) {
                    dp[i % 2][j] = ((dp[i % 2][j] + dp[(i - 1) % 2][j].toLong() * (j - k)) % MOD).toInt()
                }
            }
        }

        return dp[goal % 2][n]
    }
}
