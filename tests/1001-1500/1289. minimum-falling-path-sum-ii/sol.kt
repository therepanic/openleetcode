class Solution {
    fun minFallingPathSum(grid: Array<IntArray>): Int {
        val n = grid.size
        var dp = grid[0].copyOf()
        for (i in 1 until n) {
            var smallest = Int.MAX_VALUE
            var secondSmallest = Int.MAX_VALUE
            var smallestCol = -1
            for (col in dp.indices) {
                val value = dp[col]
                if (value < smallest) {
                    secondSmallest = smallest
                    smallest = value
                    smallestCol = col
                } else if (value < secondSmallest) {
                    secondSmallest = value
                }
            }
            dp = IntArray(n) { col ->
                grid[i][col] + if (col == smallestCol) secondSmallest else smallest
            }
        }
        return dp.min()
    }
}
