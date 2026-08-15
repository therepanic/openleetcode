class Solution {
    fun findRotation(mat: Array<IntArray>, target: Array<IntArray>): Boolean {
        var current = mat
        repeat(4) {
            if (current.contentDeepEquals(target)) return true
            current = rotate(current)
        }
        return false
    }
    
    private fun rotate(mat: Array<IntArray>): Array<IntArray> {
        val n = mat.size
        val res = Array(n) { IntArray(n) }
        for (i in 0 until n) {
            for (j in 0 until n) {
                res[j][n - 1 - i] = mat[i][j]
            }
        }
        return res
    }
}
