class Solution {
    fun removeOuterParentheses(s: String): String {
        val res = StringBuilder()
        var balance = 0
        var start = 0
        for (i in s.indices) {
            if (s[i] == '(') {
                balance++
            } else {
                balance--
            }
            if (balance == 0) {
                res.append(s, start + 1, i)
                start = i + 1
            }
        }
        return res.toString()
    }
}
