class Solution {
    fun reverseWords(s: String): String {
        val words = s.split(" ")
        val reversedWords = words.map { it.reversed() }
        return reversedWords.joinToString(" ")
    }
}
