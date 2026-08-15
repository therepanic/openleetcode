class Solution {
    fun highestPeak(isWater: Array<IntArray>): Array<IntArray> {
        val r = isWater.size
        val c = isWater[0].size
        val height = Array(r) { IntArray(c) { 1_000_000_000 } }

        for (i in 0 until r) {
            for (j in 0 until c) {
                if (isWater[i][j] == 1) {
                    height[i][j] = 0
                } else {
                    if (i > 0) height[i][j] = minOf(height[i][j], height[i - 1][j] + 1)
                    if (j > 0) height[i][j] = minOf(height[i][j], height[i][j - 1] + 1)
                }
            }
        }

        for (i in r - 1 downTo 0) {
            for (j in c - 1 downTo 0) {
                if (i < r - 1) height[i][j] = minOf(height[i][j], height[i + 1][j] + 1)
                if (j < c - 1) height[i][j] = minOf(height[i][j], height[i][j + 1] + 1)
            }
        }

        return height
    }
}
