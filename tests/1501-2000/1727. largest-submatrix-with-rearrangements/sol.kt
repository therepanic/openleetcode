class Solution {
    fun largestSubmatrix(matrix: Array<IntArray>): Int {
        val m = matrix.size
        val n = matrix[0].size
        var maxArea = 0
        val h = IntArray(n)
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (j < matrix[i].size && matrix[i][j] == 1) {
                    h[j]++
                } else {
                    h[j] = 0
                }
            }
            val sh = h.sortedDescending().toIntArray()
            for (j in 0 until n) {
                if (sh[j] == 0) break
                maxArea = maxOf(maxArea, sh[j] * (j + 1))
            }
        }
        return maxArea
    }
}
