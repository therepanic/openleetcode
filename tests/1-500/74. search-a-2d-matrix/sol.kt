class Solution {
    fun searchMatrix(matrix: Array<IntArray>, target: Int): Boolean {
        val rows = matrix.size
        val cols = matrix[0].size
        var left = 0
        var right = rows * cols - 1

        while (left <= right) {
            val mid = left + (right - left) / 2
            val value = matrix[mid / cols][mid % cols]
            if (value == target) {
                return true
            }
            if (value < target) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return false
    }
}
