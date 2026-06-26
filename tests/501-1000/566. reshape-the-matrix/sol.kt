class Solution {
    fun matrixReshape(mat: Array<IntArray>, r: Int, c: Int): Array<IntArray> {
        val m = mat.size
        val n = mat[0].size
        if (m * n != r * c) {
            return mat
        }
        
        val reshaped = Array(r) { IntArray(c) }
        var count = 0
        
        for (i in 0 until m) {
            for (j in 0 until n) {
                reshaped[count / c][count % c] = mat[i][j]
                count++
            }
        }
        
        return reshaped
    }
}
