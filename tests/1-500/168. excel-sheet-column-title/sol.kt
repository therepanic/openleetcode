class Solution {
    fun convertToTitle(columnNumber: Int): String {
        var n = columnNumber
        val chars = StringBuilder()
        while (n > 0) {
            n -= 1
            chars.append(('A'.code + n % 26).toChar())
            n /= 26
        }
        return chars.reverse().toString()
    }
}
