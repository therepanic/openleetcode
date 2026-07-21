class Solution {
    fun removePalindromeSub(s: String): Int {
        return if (s == s.reversed()) 1 else 2
    }
}
