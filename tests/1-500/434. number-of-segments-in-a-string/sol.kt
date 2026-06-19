class Solution {
    fun countSegments(s: String): Int {
        var c = 0
        for (i in s.indices) {
            if (s[i] != ' ' && (i == 0 || s[i - 1] == ' ')) {
                c++
            }
        }
        return c
    }
}
