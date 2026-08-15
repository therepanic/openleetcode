class Solution {
    fun sortSentence(s: String): String {
        val words = mutableMapOf<Int, String>()
        for (word in s.split(" ")) {
            words[word.last().digitToInt()] = word.dropLast(1)
        }
        return (1..9).filter { words.containsKey(it) }.joinToString(" ") { words[it]!! }
    }
}
