class Solution {
    fun numberOfLines(widths: IntArray, s: String): IntArray {
        var lines = 1
        var current = 0
        for (c in s) {
            val w = widths[c.code - 97]
            if (current + w > 100) {
                lines++
                current = w
            } else {
                current += w
            }
        }
        return intArrayOf(lines, current)
    }
}
