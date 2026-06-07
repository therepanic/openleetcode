class Solution {
    fun minDistance(word1: String, word2: String): Int {
        val m = word1.length
        val n = word2.length
        val dp = IntArray(n + 1) { it }

        for (i in 1..m) {
            var prev = dp[0]
            dp[0] = i
            for (j in 1..n) {
                val temp = dp[j]
                if (word1[i - 1] == word2[j - 1]) {
                    dp[j] = prev
                } else {
                    dp[j] = 1 + minOf(prev, dp[j], dp[j - 1])
                }
                prev = temp
            }
        }

        return dp[n]
    }
}
