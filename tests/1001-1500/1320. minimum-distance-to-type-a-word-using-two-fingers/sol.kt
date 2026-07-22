class Solution {
    private fun cal(a: Int, b: Int): Int {
        return Math.abs(a / 6 - b / 6) + Math.abs(a % 6 - b % 6)
    }

    fun minimumDistance(word: String): Int {
        val n = word.length
        var dp = IntArray(26) { 0 }
        var ndp = IntArray(26) { 0 }

        for (i in 1 until n) {
            val p = word[i - 1] - 'A'
            val t = word[i] - 'A'

            for (j in 0 until 26) {
                ndp[j] = dp[j] + cal(p, t)
            }

            for (j in 0 until 26) {
                ndp[p] = minOf(ndp[p], dp[j] + cal(j, t))
            }

            val temp = dp
            dp = ndp
            ndp = temp
        }

        return dp.min()
    }
}
