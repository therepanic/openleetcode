class Solution {
    fun numPermsDISequence(s: String): Int {
        val n = s.length
        val MOD = 1000000007
        var dp = intArrayOf(1)
        for (i in 1..n) {
            val prefix = IntArray(i + 1)
            prefix[0] = dp[0]
            for (j in 1 until i) {
                prefix[j] = (prefix[j-1] + dp[j]) % MOD
            }
            prefix[i] = prefix[i-1] % MOD
            val ndp = IntArray(i + 1)
            if (s[i-1] == 'I') {
                for (j in 0..i) {
                    ndp[j] = if (j > 0) prefix[j-1] % MOD else 0
                }
            } else {
                for (j in 0..i) {
                    ndp[j] = (prefix[i-1] - (if (j > 0) prefix[j-1] else 0)) % MOD
                    if (ndp[j] < 0) ndp[j] += MOD
                }
            }
            dp = ndp
        }
        return dp.fold(0) { acc, v -> (acc + v) % MOD }
    }
}
