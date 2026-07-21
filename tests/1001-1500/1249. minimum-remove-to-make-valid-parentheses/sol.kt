class Solution {
    fun minRemoveToMakeValid(s: String): String {
        val t = StringBuilder()
        var p = 0
        for (c in s) {
            if (c == '(') p++
            else if (c == ')') p--
            if (p >= 0) {
                t.append(c)
            } else {
                p = 0
            }
        }
        p = 0
        val result = StringBuilder()
        val str = t.toString()
        for (i in str.length - 1 downTo 0) {
            val c = str[i]
            if (c == '(') p++
            else if (c == ')') p--
            if (p <= 0) {
                result.append(c)
            } else {
                p = 0
            }
        }
        return result.reverse().toString()
    }
}
