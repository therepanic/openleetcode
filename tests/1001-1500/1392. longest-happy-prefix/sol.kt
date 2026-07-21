class Solution {
    fun longestPrefix(s: String): String {
        val n = s.length
        val prefix = IntArray(n)
        var matched = 0
        for (i in 1 until n) {
            while (matched > 0 && s[i] != s[matched]) {
                matched = prefix[matched - 1]
            }
            if (s[i] == s[matched]) {
                matched++
            }
            prefix[i] = matched
        }
        return s.substring(0, prefix[n - 1])
    }
}
