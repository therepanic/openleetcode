class Solution {
    fun longestPalindrome(s: String): String {
        if (s.isEmpty()) {
            return ""
        }

        var start = 0
        var best = 1
        for (i in s.indices) {
            val len1 = expand(s, i, i)
            val len2 = expand(s, i, i + 1)
            val len = maxOf(len1, len2)
            if (len > best) {
                best = len
                start = i - (len - 1) / 2
            }
        }

        return s.substring(start, start + best)
    }

    private fun expand(s: String, left0: Int, right0: Int): Int {
        var left = left0
        var right = right0
        while (left >= 0 && right < s.length && s[left] == s[right]) {
            left--
            right++
        }
        return right - left - 1
    }
}
