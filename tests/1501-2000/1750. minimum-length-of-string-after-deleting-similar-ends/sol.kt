class Solution {
    fun minimumLength(s: String): Int {
        var left = 0
        var right = s.length - 1
        while (left < right && s[left] == s[right]) {
            val ch = s[left]
            while (left <= right && s[left] == ch) {
                left++
            }
            while (left <= right && s[right] == ch) {
                right--
            }
        }
        return maxOf(0, right - left + 1)
    }
}
