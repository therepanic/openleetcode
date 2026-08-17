class Solution {
    fun kthLargestValue(matrix: Array<IntArray>, k: Int): Int {
        val n = matrix.size
        val m = matrix[0].size
        val temp = Array(n) { IntArray(m) }
        temp[0][0] = matrix[0][0]
        for (j in 1 until m) temp[0][j] = temp[0][j-1] xor matrix[0][j]
        for (i in 1 until n) temp[i][0] = temp[i-1][0] xor matrix[i][0]
        for (i in 1 until n) {
            for (j in 1 until m) {
                temp[i][j] = matrix[i][j] xor temp[i-1][j] xor temp[i][j-1] xor temp[i-1][j-1]
            }
        }
        val arr = IntArray(n * m)
        var index = 0
        for (row in temp) {
            for (value in row) {
                arr[index++] = value
            }
        }
        arr.sort()
        return arr[n*m - k]
    }
}
