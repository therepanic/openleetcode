class Solution {
    fun maximumScore(nums: IntArray, multipliers: IntArray): Int {
        val m = multipliers.size
        val dp = Array(m + 1) { arrayOfNulls<Int>(m + 1) }
        
        fun f(i: Int, j: Int): Int {
            val k = i + j
            if (k == m) return 0
            dp[i][j]?.let { return it }
            
            val back = multipliers[k] * nums[nums.size - 1 - j] + f(i, j + 1)
            val front = multipliers[k] * nums[i] + f(i + 1, j)
            val result = maxOf(front, back)
            dp[i][j] = result
            return result
        }
        
        return f(0, 0)
    }
}
