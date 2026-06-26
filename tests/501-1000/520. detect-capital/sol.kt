class Solution {
    fun detectCapitalUse(word: String): Boolean {
        return word == word.uppercase() || 
               word == word.lowercase() || 
               word == word.substring(0, 1).uppercase() + word.substring(1).lowercase()
    }
}
