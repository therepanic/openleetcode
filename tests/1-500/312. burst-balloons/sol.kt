class Solution {
    fun maxCoins(nums: IntArray): Int {
        val balloons = IntArray(nums.size + 2)
        balloons[0] = 1
        balloons[balloons.size - 1] = 1
        for (i in nums.indices) {
            balloons[i + 1] = nums[i]
        }
        val n = balloons.size
        val dp = Array(n) { IntArray(n) }
        
        for (length in 2 until n) {
            for (left in 0 until n - length) {
                val right = left + length
                var best = 0
                for (k in left + 1 until right) {
                    val gain = balloons[left] * balloons[k] * balloons[right]
                    val total = gain + dp[left][k] + dp[k][right]
                    if (total > best) {
                        best = total
                    }
                }
                dp[left][right] = best
            }
        }
        
        return dp[0][n-1]
    }
}
