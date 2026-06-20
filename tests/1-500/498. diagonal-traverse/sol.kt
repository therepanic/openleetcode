class Solution {
    fun findDiagonalOrder(mat: Array<IntArray>): IntArray {
        if (mat.isEmpty() || mat[0].isEmpty()) {
            return intArrayOf()
        }
        
        val m = mat.size
        val n = mat[0].size
        val result = IntArray(m * n)
        var row = 0
        var col = 0
        
        for (i in 0 until m * n) {
            result[i] = mat[row][col]
            
            if ((row + col) % 2 == 0) {
                if (col == n - 1) {
                    row++
                } else if (row == 0) {
                    col++
                } else {
                    row--
                    col++
                }
            } else {
                if (row == m - 1) {
                    col++
                } else if (col == 0) {
                    row++
                } else {
                    row++
                    col--
                }
            }
        }
        
        return result
    }
}
