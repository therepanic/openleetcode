class Solution {
    private var i = 0

    fun reverseParentheses(s: String): String {
        i = 0
        return helper(s)
    }

    private fun helper(s: String): String {
        val ans = StringBuilder()
        while (i < s.length) {
            when (s[i]) {
                '(' -> {
                    i++
                    ans.append(helper(s))
                }
                ')' -> {
                    i++
                    return ans.reverse().toString()
                }
                else -> {
                    ans.append(s[i])
                    i++
                }
            }
        }
        return ans.toString()
    }
}
