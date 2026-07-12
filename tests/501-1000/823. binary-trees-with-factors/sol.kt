class Solution {
    fun numFactoredBinaryTrees(arr: IntArray): Int {
        val MOD = 1_000_000_007
        arr.sort()
        val dp = mutableMapOf<Int, Long>()
        val s = arr.toSet()
        for (x in arr) {
            dp[x] = 1L
            for (a in arr) {
                if (a > x) break
                if (x % a == 0) {
                    val b = x / a
                    if (b in s) {
                        dp[x] = (dp[x]!! + dp[a]!! * dp[b]!!) % MOD
                    }
                }
            }
        }
        return (dp.values.sum() % MOD).toInt()
    }
}
