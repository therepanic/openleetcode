class Solution {
    fun repeatedSubstringPattern(s: String): Boolean {
        val doubled = (s + s).substring(1, 2 * s.length - 1)
        return doubled.contains(s)
    }
}
