class Solution {
    fun isNumber(s: String): Boolean {
        var seenDigit = false
        var seenDot = false
        var seenExp = false
        var seenDigitAfterExp = true

        for (i in s.indices) {
            val c = s[i]
            when {
                c.isDigit() -> {
                    seenDigit = true
                    seenDigitAfterExp = true
                }
                c == '.' -> {
                    if (seenDot || seenExp) {
                        return false
                    }
                    seenDot = true
                }
                c == 'e' || c == 'E' -> {
                    if (seenExp || !seenDigit) {
                        return false
                    }
                    seenExp = true
                    seenDigitAfterExp = false
                }
                c == '+' || c == '-' -> {
                    if (i > 0) {
                        val prev = s[i - 1]
                        if (prev != 'e' && prev != 'E') {
                            return false
                        }
                    }
                }
                else -> return false
            }
        }

        return seenDigit && seenDigitAfterExp
    }
}
