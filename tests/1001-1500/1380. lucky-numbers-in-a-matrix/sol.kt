class Solution {
    fun luckyNumbers(matrix: Array<IntArray>): List<Int> {
        val rows = matrix.size
        val cols = matrix[0].size
        val ans = mutableListOf<Int>()
        for (i in 0 until rows) {
            for (j in 0 until cols) {
                var ele1 = Int.MAX_VALUE
                for (k in 0 until cols) {
                    if (matrix[i][k] < ele1) ele1 = matrix[i][k]
                }
                var ele2 = Int.MIN_VALUE
                for (k in 0 until rows) {
                    if (matrix[k][j] > ele2) ele2 = matrix[k][j]
                }
                if (ele1 == matrix[i][j] && ele2 == matrix[i][j]) {
                    ans.add(matrix[i][j])
                }
            }
        }
        return ans
    }
}
