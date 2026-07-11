class Solution {
    fun transpose(matrix: Array<IntArray>): Array<IntArray> {
        val row = matrix.size
        val col = matrix[0].size
        val trans = Array(col) { IntArray(row) }

        for (i in 0 until col) {
            for (j in 0 until row) {
                trans[i][j] = matrix[j][i]
            }
        }

        return trans
    }
}
