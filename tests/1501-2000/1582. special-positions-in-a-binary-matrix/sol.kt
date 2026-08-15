class Solution {
    fun numSpecial(mat: Array<IntArray>): Int {
        val m = mat.size
        val n = mat[0].size
        val row = IntArray(m)
        val col = IntArray(n)

        for (i in 0 until m) {
            for (j in 0 until n) {
                if (mat[i][j] == 1) {
                    row[i]++
                    col[j]++
                }
            }
        }

        var result = 0
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (mat[i][j] == 1 && row[i] == 1 && col[j] == 1) {
                    result++
                }
            }
        }
        return result
    }
}
