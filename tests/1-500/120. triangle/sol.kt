
class Solution {
    fun minimumTotal(triangle: Array<IntArray>): Int {
        val dp = triangle[triangle.size - 1].clone()
        for (row in triangle.size - 2 downTo 0) {
            for (col in triangle[row].indices) {
                dp[col] = triangle[row][col] + minOf(dp[col], dp[col + 1])
            }
        }
        return dp[0]
    }
}
