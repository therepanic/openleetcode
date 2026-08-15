class Solution {
    fun findPeakGrid(mat: Array<IntArray>): IntArray {
        val n = mat.size
        val m = mat[0].size

        var low = 0
        var high = m - 1

        while (low <= high) {
            val mid = low + (high - low) / 2

            var maxRow = 0
            for (i in 1 until n) {
                if (mat[i][mid] > mat[maxRow][mid]) {
                    maxRow = i
                }
            }

            val left = if (mid > 0) mat[maxRow][mid - 1] else -1
            val right = if (mid < m - 1) mat[maxRow][mid + 1] else -1

            if (mat[maxRow][mid] > left && mat[maxRow][mid] > right) {
                return intArrayOf(maxRow, mid)
            }

            if (mat[maxRow][mid] < left) {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return intArrayOf(-1, -1)
    }
}
