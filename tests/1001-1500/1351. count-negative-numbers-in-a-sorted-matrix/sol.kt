class Solution {
    fun countNegatives(grid: Array<IntArray>): Int {
        var count = 0
        for (row in grid) {
            for (num in row) {
                if (num < 0) count++
            }
        }
        return count
    }
}
