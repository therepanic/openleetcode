class Solution {
    fun distinctSubseqII(s: String): Int {
        val n = s.length
        val mod = 1000000007
        val dp = IntArray(n)
        dp[0] = 2
        val mp = IntArray(26) { -1 }
        mp[s[0] - 'a'] = 0
        for (i in 1 until n) {
            dp[i] = (2 * dp[i-1]) % mod
            val idx = s[i] - 'a'
            if (mp[idx] != -1) {
                dp[i] -= if (mp[idx] > 0) dp[mp[idx]-1] else 1
                if (dp[i] < 0) dp[i] += mod
            }
            mp[idx] = i
            dp[i] %= mod
        }
        return (dp[n-1] - 1 + mod) % mod
    }
}
