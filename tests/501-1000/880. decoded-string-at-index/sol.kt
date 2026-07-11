class Solution {
    fun decodeAtIndex(s: String, k: Int): String {
        var size: Long = 0
        for (ch in s) {
            if (ch.isDigit()) {
                size *= ch - '0'
            } else {
                size++
            }
        }

        var kk = k.toLong()
        for (i in s.length - 1 downTo 0) {
            val ch = s[i]
            kk %= size
            if (kk == 0L && ch.isLetter()) {
                return ch.toString()
            }
            if (ch.isDigit()) {
                size /= ch - '0'
            } else {
                size--
            }
        }
        return ""
    }
}
