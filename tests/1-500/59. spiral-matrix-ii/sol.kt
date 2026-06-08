class Solution {
    fun generateMatrix(n: Int): Array<IntArray> {
        val res = Array(n) { IntArray(n) }
        var top = 0
        var bottom = n - 1
        var left = 0
        var right = n - 1
        var value = 1

        while (top <= bottom && left <= right) {
            for (col in left..right) {
                res[top][col] = value++
            }
            top++

            for (row in top..bottom) {
                res[row][right] = value++
            }
            right--

            if (top <= bottom) {
                for (col in right downTo left) {
                    res[bottom][col] = value++
                }
                bottom--
            }

            if (left <= right) {
                for (row in bottom downTo top) {
                    res[row][left] = value++
                }
                left++
            }
        }

        return res
    }
}
