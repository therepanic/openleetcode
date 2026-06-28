class Solution {
    fun isToeplitzMatrix(matrix: Array<IntArray>): Boolean {
        val n = matrix.size
        val m = matrix[0].size
        
        for (i in 0 until n - 1) {
            for (j in 0 until m - 1) {
                if (matrix[i][j] != matrix[i + 1][j + 1]) {
                    return false
                }
            }
        }
        
        return true
    }
}
