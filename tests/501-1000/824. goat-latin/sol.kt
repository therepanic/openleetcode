class Solution {
    fun toGoatLatin(sentence: String): String {
        val vowels = setOf('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
        val words = sentence.split(" ")
        val ans = mutableListOf<String>()
        for ((i, word) in words.withIndex()) {
            val goat = if (word[0] in vowels) {
                word + "ma"
            } else {
                word.substring(1) + word[0] + "ma"
            }
            ans.add(goat + "a".repeat(i + 1))
        }
        return ans.joinToString(" ")
    }
}
