class Solution {
    fun validPalindrome(s: String): Boolean {
        fun isPalindrome(l: Int, r: Int): Boolean {
            var i = l
            var j = r
            while (i < j) {
                if (s[i] != s[j]) {
                    return false
                }
                i++
                j--
            }
            return true
        }
        
        var left = 0
        var right = s.length - 1
        while (left < right) {
            if (s[left] != s[right]) {
                return isPalindrome(left + 1, right) || isPalindrome(left, right - 1)
            }
            left++
            right--
        }
        return true
    }
}
