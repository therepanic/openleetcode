class Solution {
    fun bestTeamScore(scores: IntArray, ages: IntArray): Int {
        val n = scores.size
        val players = Array(n) { intArrayOf(ages[it], scores[it]) }
        players.sortWith(compareBy<IntArray> { it[0] }.thenBy { it[1] })
        val dp = IntArray(n)
        for (i in 0 until n) dp[i] = players[i][1]
        for (i in 0 until n) {
            for (j in 0 until i) {
                if (players[j][1] <= players[i][1]) {
                    dp[i] = maxOf(dp[i], dp[j] + players[i][1])
                }
            }
        }
        return dp.max()!!
    }
}
