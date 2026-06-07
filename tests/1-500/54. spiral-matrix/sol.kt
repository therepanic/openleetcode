class Solution {
    fun spiralOrder(matrix: Array<IntArray>): List<Int> {
        val res = mutableListOf<Int>()
        var top = 0
        var bottom = matrix.size - 1
        var left = 0
        var right = matrix[0].size - 1

        while (top <= bottom && left <= right) {
            for (col in left..right) {
                res.add(matrix[top][col])
            }
            top++

            for (row in top..bottom) {
                res.add(matrix[row][right])
            }
            right--

            if (top <= bottom) {
                for (col in right downTo left) {
                    res.add(matrix[bottom][col])
                }
                bottom--
            }

            if (left <= right) {
                for (row in bottom downTo top) {
                    res.add(matrix[row][left])
                }
                left++
            }
        }

        return res
    }
}
