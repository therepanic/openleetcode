class Solution {
    fun checkPalindromeFormation(a: String, b: String): Boolean {
        return check(a, b) || check(b, a)
    }

    private fun check(a: String, b: String): Boolean {
        var i = 0
        var j = a.length - 1
        while (i < j && a[i] == b[j]) {
            i++
            j--
        }
        return isPalindrome(a.substring(i, j + 1)) || isPalindrome(b.substring(i, j + 1))
    }

    private fun isPalindrome(s: String): Boolean = s == s.reversed()
}
