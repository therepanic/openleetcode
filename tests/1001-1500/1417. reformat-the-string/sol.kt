class Solution {
    fun reformat(s: String): String {
        val digits = mutableListOf<Char>()
        val letters = mutableListOf<Char>()
        for (c in s) {
            if (c.isDigit()) {
                digits.add(c)
            } else if (c.isLetter()) {
                letters.add(c)
            }
        }
        if (Math.abs(digits.size - letters.size) >= 2) {
            return ""
        }
        val ans = CharArray(s.length)
        if (digits.size > letters.size) {
            for (i in ans.indices) {
                ans[i] = if (i % 2 == 0) digits[i / 2] else letters[i / 2]
            }
        } else {
            for (i in ans.indices) {
                ans[i] = if (i % 2 == 0) letters[i / 2] else digits[i / 2]
            }
        }
        return String(ans)
    }
}
