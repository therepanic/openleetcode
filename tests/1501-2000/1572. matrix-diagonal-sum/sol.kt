class Solution {
    fun diagonalSum(mat: Array<IntArray>): Int {
        var summ = 0
        val n = mat.size
        for (i in 0 until n) {
            summ += mat[i][i]
            summ += mat[i][n - 1 - i]
        }
        if (n % 2 == 1) {
            summ -= mat[n / 2][n / 2]
        }
        return summ
    }
}
