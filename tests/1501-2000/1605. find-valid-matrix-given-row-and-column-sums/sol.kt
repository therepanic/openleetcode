class Solution {
    fun restoreMatrix(rowSum: IntArray, colSum: IntArray): Array<IntArray> {
        val m = rowSum.size
        val n = colSum.size
        val matrix = Array(m) { IntArray(n) }
        var i = 0
        var j = 0
        while (i < m && j < n) {
            val value = minOf(rowSum[i], colSum[j])
            matrix[i][j] = value
            rowSum[i] -= value
            colSum[j] -= value
            if (rowSum[i] == 0) i++
            if (colSum[j] == 0) j++
        }
        return matrix
    }
}
