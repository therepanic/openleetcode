class Solution {
    fun numberOfArrays(s: String, k: Int): Int {
        val mod = 1000000007
        val n = s.length
        val dp = IntArray(n + 1)
        dp[0] = 1
        val width = k.toString().length
        for (i in 0 until n) {
            if (s[i] == '0' || dp[i] == 0) continue
            var value = 0L
            for (j in i until minOf(n, i + width)) {
                value = value * 10 + (s[j] - '0')
                if (value > k) break
                dp[j + 1] = (dp[j + 1] + dp[i]) % mod
            }
        }
        return dp[n]
    }
}
