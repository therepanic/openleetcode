class Solution {
    fun maxSumDivThree(nums: IntArray): Int {
        val n = nums.size
        val minus = -(1 shl 30)
        val dp = arrayOf(intArrayOf(0, 0, 0), intArrayOf(0, minus, minus))
        for (i in nums.indices) {
            val x = nums[i]
            val x3 = x % 3
            for (mod in 0..2) {
                val modPrev = (3 + mod - x3) % 3
                val take = x + dp[(i + 1) and 1][modPrev]
                val skip = dp[(i + 1) and 1][mod]
                dp[i and 1][mod] = maxOf(take, skip)
            }
        }
        return maxOf(0, dp[(n - 1) and 1][0])
    }
}
