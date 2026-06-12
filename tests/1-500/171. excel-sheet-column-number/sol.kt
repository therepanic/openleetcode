class Solution {
    fun titleToNumber(columnTitle: String): Int {
        var ans = 0
        for (ch in columnTitle) ans = ans * 26 + (ch.code - 'A'.code + 1)
        return ans
    }
}
