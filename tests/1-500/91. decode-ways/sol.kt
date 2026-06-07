class Solution {
    fun numDecodings(s: String): Int {
        if (s.isEmpty() || s[0] == '0') return 0

        var prev2 = 1
        var prev1 = 1

        for (i in 1 until s.length) {
            var current = 0
            if (s[i] != '0') {
                current += prev1
            }
            val value = (s[i - 1] - '0') * 10 + (s[i] - '0')
            if (value in 10..26) {
                current += prev2
            }
            prev2 = prev1
            prev1 = current
        }

        return prev1
    }
}
