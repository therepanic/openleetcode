class Solution {
    fun minSwaps(grid: Array<IntArray>): Int {
        val n = grid.size
        val zeros = IntArray(n)
        for (i in 0 until n) {
            var count = 0
            for (j in n - 1 downTo 0) {
                if (grid[i][j] == 0) {
                    count++
                } else {
                    break
                }
            }
            zeros[i] = count
        }
        var swaps = 0
        for (i in 0 until n) {
            val needed = n - i - 1
            var j = i
            while (j < n && zeros[j] < needed) {
                j++
            }
            if (j == n) {
                return -1
            }
            while (j > i) {
                val temp = zeros[j]
                zeros[j] = zeros[j - 1]
                zeros[j - 1] = temp
                j--
                swaps++
            }
        }
        return swaps
    }
}
