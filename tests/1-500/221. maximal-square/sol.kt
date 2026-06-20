class Solution {
    fun maximalSquare(matrix: Array<Array<String>>): Int {
        if (matrix.isEmpty() || matrix[0].isEmpty()) {
            return 0
        }
        val Rows = matrix.size
        val Cols = matrix[0].size
        var maxArea = 0
        val dp = Array(Rows) { IntArray(Cols) }

        for (r in Rows - 1 downTo 0) {
            for (c in Cols - 1 downTo 0) {
                if (matrix[r][c] == "1") {
                    val down = if (r + 1 < Rows) dp[r + 1][c] else 0
                    val right = if (c + 1 < Cols) dp[r][c + 1] else 0
                    val diag = if (r + 1 < Rows && c + 1 < Cols) dp[r + 1][c + 1] else 0
                    dp[r][c] = 1 + minOf(down, right, diag)
                } else {
                    dp[r][c] = 0
                }
                maxArea = maxOf(maxArea, dp[r][c])
            }
        }
        return maxArea * maxArea
    }
}
