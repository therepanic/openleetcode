class Solution {
    fun getBiggestThree(grid: Array<IntArray>): IntArray {
        val m = grid.size
        val n = grid[0].size
        val maxD = (minOf(m, n) - 1) / 2
        val list = mutableListOf<Int>()
        val seen = HashSet<Int>()
        for (d in 0..maxD) {
            for (i in d until m - d) {
                for (j in d until n - d) {
                    val sum = diamondSum(grid, i, j, d)
                    if (seen.add(sum)) list.add(sum)
                }
            }
        }
        list.sortDescending()
        return list.take(3).toIntArray()
    }
    
    private fun diamondSum(grid: Array<IntArray>, i: Int, j: Int, d: Int): Int {
        if (d == 0) return grid[i][j]
        var sum = 0
        for (t in 0..d) sum += grid[i - d + t][j + t]
        for (t in 1..d) sum += grid[i + t][j + d - t]
        for (t in 1..d) sum += grid[i + d - t][j - t]
        for (t in 1 until d) sum += grid[i - t][j - d + t]
        return sum
    }
}
