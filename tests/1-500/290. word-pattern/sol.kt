class Solution {
    fun wordPattern(pattern: String, s: String): Boolean {
        val words = s.split(" ")
        if (pattern.length != words.size) return false

        val patternChars = pattern.toList()
        return patternChars.toSet().size == words.toSet().size &&
               patternChars.toSet().size == patternChars.zip(words).toSet().size
    }
}
