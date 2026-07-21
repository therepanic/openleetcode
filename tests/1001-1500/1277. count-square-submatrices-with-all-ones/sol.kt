class Solution {
    fun countSquares(matrix: Array<IntArray>): Int {
        if (matrix.isEmpty() || matrix[0].isEmpty()) {
            return 0
        }
        
        val m = matrix.size
        val n = matrix[0].size
        var res = 0
        
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (matrix[i][j] == 1 && i > 0 && j > 0) {
                    matrix[i][j] = minOf(
                        matrix[i-1][j],
                        matrix[i][j-1],
                        matrix[i-1][j-1]
                    ) + 1
                }
                res += matrix[i][j]
            }
        }
        
        return res
    }
}
