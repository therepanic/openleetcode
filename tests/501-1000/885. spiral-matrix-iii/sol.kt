class Solution {
    fun spiralMatrixIII(rows: Int, cols: Int, rStart: Int, cStart: Int): Array<IntArray> {
        val total = rows * cols
        val res = Array(total) { IntArray(2) }
        var idx = 0
        res[idx++] = intArrayOf(rStart, cStart)
        var top = rStart
        var bottom = rStart
        var left = cStart
        var right = cStart
        while (idx < total) {
            right++
            for (i in left + 1..right) {
                if (top in 0 until rows && i in 0 until cols) {
                    res[idx++] = intArrayOf(top, i)
                    if (idx == total) return res
                }
            }
            bottom++
            for (i in top + 1..bottom) {
                if (right in 0 until cols && i in 0 until rows) {
                    res[idx++] = intArrayOf(i, right)
                    if (idx == total) return res
                }
            }
            left--
            for (i in right - 1 downTo left) {
                if (i in 0 until cols && bottom in 0 until rows) {
                    res[idx++] = intArrayOf(bottom, i)
                    if (idx == total) return res
                }
            }
            top--
            for (i in bottom - 1 downTo top) {
                if (i in 0 until rows && left in 0 until cols) {
                    res[idx++] = intArrayOf(i, left)
                    if (idx == total) return res
                }
            }
        }
        return res
    }
}
