class Solution {
    fun minSideJumps(obstacles: IntArray): Int {
        val INF = Int.MAX_VALUE / 2
        var dp = intArrayOf(1, 0, 1)
        for (i in 1 until obstacles.size) {
            val obs = obstacles[i]
            for (j in 0..2) {
                if (obs == j + 1) dp[j] = INF
            }
            for (j in 0..2) {
                if (obs != j + 1) {
                    dp[j] = minOf(dp[j], minOf(dp[(j + 1) % 3], dp[(j + 2) % 3]) + 1)
                }
            }
        }
        return dp.minOrNull() ?: 0
    }
}
