class Solution {
    fun reverseWords(s: String): String {
        return s.trim().split(Regex("\\s+")).reversed().joinToString(" ")
    }
}
