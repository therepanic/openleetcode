class Solution {
    fun champagneTower(poured: Int, query_row: Int, query_glass: Int): Double {
        val tower = Array(102) { DoubleArray(102) }
        tower[0][0] = poured.toDouble()
        
        for (r in 0..query_row) {
            for (c in 0..r) {
                if (tower[r][c] > 1) {
                    val excess = (tower[r][c] - 1.0) / 2.0
                    tower[r][c] = 1.0
                    tower[r+1][c] += excess
                    tower[r+1][c+1] += excess
                }
            }
        }
        
        return tower[query_row][query_glass]
    }
}
