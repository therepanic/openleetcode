class Solution {
    fun replaceDigits(s: String): String {
        val chars = s.toCharArray()
        for (i in 1 until chars.size step 2) {
            val ch = chars[i - 1]
            val digit = chars[i] - '0'
            chars[i] = (ch + digit).toChar()
        }
        return String(chars)
    }
}
