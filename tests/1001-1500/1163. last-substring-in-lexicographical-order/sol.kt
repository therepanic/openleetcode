class Solution {
    fun lastSubstring(s: String): String {
        var i = 0
        var j = 1
        var k = 0
        val n = s.length
        while (j + k < n) {
            when {
                s[i + k] == s[j + k] -> {
                    k++
                    continue
                }
                s[i + k] > s[j + k] -> {
                    j = j + k + 1
                }
                else -> {
                    i = maxOf(i + k + 1, j)
                    j = i + 1
                }
            }
            k = 0
        }
        return s.substring(i)
    }
}
