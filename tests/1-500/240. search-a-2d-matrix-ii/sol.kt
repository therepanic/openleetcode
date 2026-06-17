class Solution {
    fun searchMatrix(matrix: Array<IntArray>, target: Int): Boolean {
        var v = false
        for (i in matrix) {
            for (j in i.indices) {
                if (i[j] == target) {
                    v = true
                }
            }
        }
        return v
    }
}
