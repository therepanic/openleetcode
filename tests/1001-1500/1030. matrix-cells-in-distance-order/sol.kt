class Solution {
    fun allCellsDistOrder(rows: Int, cols: Int, rCenter: Int, cCenter: Int): Array<IntArray> {
        val result = Array(rows * cols) { IntArray(2) }
        var idx = 0
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                result[idx][0] = r
                result[idx][1] = c
                idx++
            }
        }
        result.sortWith(
            compareBy<IntArray> { kotlin.math.abs(it[0] - rCenter) + kotlin.math.abs(it[1] - cCenter) }
                .thenBy { it[0] }
                .thenBy { it[1] }
        )
        return result
    }
}
