class Solution {
    fun countSpecialSubsequences(nums: IntArray): Int {
        val MOD = 1_000_000_007
        var dp0 = 0L
        var dp1 = 0L
        var dp2 = 0L
        for (x in nums) {
            when (x) {
                0 -> dp0 = (2 * dp0 + 1) % MOD
                1 -> dp1 = (2 * dp1 + dp0) % MOD
                else -> dp2 = (2 * dp2 + dp1) % MOD
            }
        }
        return dp2.toInt()
    }
}
