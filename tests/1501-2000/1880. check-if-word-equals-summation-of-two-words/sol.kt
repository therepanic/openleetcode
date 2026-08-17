class Solution {
    fun isSumEqual(firstWord: String, secondWord: String, targetWord: String): Boolean {
        fun convert(word: String): Int {
            return word.map { it - 'a' }.joinToString("").toInt()
        }
        return convert(firstWord) + convert(secondWord) == convert(targetWord)
    }
}
