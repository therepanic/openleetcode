class Solution {
    fun isSubsequence(s: String, t: String): Boolean {
        var sp = 0
        var tp = 0
        while (sp < s.length && tp < t.length) {
            if (s[sp] == t[tp]) {
                sp++
            }
            tp++
        }
        return sp == s.length
    }
}
