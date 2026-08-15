class Solution {
    fun maxHeight(cuboids: Array<IntArray>): Int {
        cuboids.forEach { it.sort() }
        cuboids.sortWith(compareBy<IntArray> { it[0] }.thenBy { it[1] }.thenBy { it[2] })
        val n = cuboids.size
        val dp = IntArray(n)
        var ans = 0
        for (i in 0 until n) {
            dp[i] = cuboids[i][2]
            for (j in 0 until i) {
                if (cuboids[j][0] <= cuboids[i][0] && cuboids[j][1] <= cuboids[i][1] && cuboids[j][2] <= cuboids[i][2]) {
                    dp[i] = maxOf(dp[i], dp[j] + cuboids[i][2])
                }
            }
            ans = maxOf(ans, dp[i])
        }
        return ans
    }
}
