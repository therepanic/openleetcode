class Solution {
    fun maxScore(nums: IntArray): Int {
        val n = nums.size
        val dp = Array(1 shl n) { IntArray(n / 2 + 1) { -1 } }
        fun gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)
        fun dfs(mask: Int, op: Int): Int {
            if (mask == (1 shl n) - 1) return 0
            if (dp[mask][op] != -1) return dp[mask][op]
            var ans = 0
            for (i in 0 until n) {
                if ((mask and (1 shl i)) == 0) {
                    for (j in 0 until n) {
                        if (j != i && (mask and (1 shl j)) == 0) {
                            val nmask = mask or (1 shl i) or (1 shl j)
                            ans = maxOf(ans, dfs(nmask, op + 1) + gcd(nums[i], nums[j]) * op)
                        }
                    }
                }
            }
            dp[mask][op] = ans
            return ans
        }
        return dfs(0, 1)
    }
}
