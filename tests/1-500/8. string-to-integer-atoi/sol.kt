class Solution {
    fun myAtoi(s: String): Int {
        var i = 0
        val n = s.length
        while (i < n && s[i] == ' ') {
            i++
        }
        if (i == n) {
            return 0
        }

        var sign = 1
        if (s[i] == '+' || s[i] == '-') {
            if (s[i] == '-') {
                sign = -1
            }
            i++
        }

        var res = 0L
        while (i < n && s[i].isDigit()) {
            val digit = s[i] - '0'
            if (sign == 1) {
                if (res > Int.MAX_VALUE / 10L || (res == Int.MAX_VALUE / 10L && digit > 7)) {
                    return Int.MAX_VALUE
                }
            } else {
                if (res > 2147483648L / 10L || (res == 2147483648L / 10L && digit > 8)) {
                    return Int.MIN_VALUE
                }
            }
            res = res * 10 + digit
            i++
        }

        return if (sign == 1) res.toInt() else (-res).toInt()
    }
}
