class Solution {
    fun countBinarySubstrings(s: String): Int {
        var ans = 0
        var prev = 0
        var cur = 1
        for (i in 1 until s.length) {
            if (s[i-1] != s[i]) {
                ans += minOf(prev, cur)
                prev = cur
                cur = 1
            } else {
                cur++
            }
        }
        return ans + minOf(prev, cur)
    }
}
