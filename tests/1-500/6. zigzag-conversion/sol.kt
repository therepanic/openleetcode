class Solution {
    fun convert(s: String, numRows: Int): String {
        if (numRows == 1 || numRows >= s.length) {
            return s
        }

        val rows = Array(numRows) { StringBuilder() }
        var idx = 0
        var step = 1

        for (c in s) {
            rows[idx].append(c)
            if (idx == 0) {
                step = 1
            } else if (idx == numRows - 1) {
                step = -1
            }
            idx += step
        }

        val result = StringBuilder()
        for (row in rows) {
            result.append(row)
        }
        return result.toString()
    }
}
