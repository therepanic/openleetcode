class Solution {
    fun rearrangeSticks(n: Int, k: Int): Int {
        val mod = 1000000007
        var dp = IntArray(k + 1)
        dp[0] = 1
        for (length in 1..n) {
            val nxt = IntArray(k + 1)
            for (visible in 1..minOf(length, k)) {
                nxt[visible] = ((dp[visible - 1].toLong() + (length - 1).toLong() * dp[visible]) % mod).toInt()
            }
            dp = nxt
        }
        return dp[k]
    }
}
