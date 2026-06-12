
class Solution {
    fun numDistinct(s: String, t: String): Int {
        val dp = LongArray(t.length + 1)
        dp[0] = 1
        for (ch in s) {
            for (j in t.length - 1 downTo 0) {
                if (ch == t[j]) dp[j + 1] += dp[j]
            }
        }
        return dp[t.length].toInt()
    }
}
