class Solution {
    fun isPrefixOfWord(sentence: String, searchWord: String): Int {
        val words = sentence.split(" ")
        for (i in words.indices) {
            if (words[i].startsWith(searchWord)) {
                return i + 1
            }
        }
        return -1
    }
}
