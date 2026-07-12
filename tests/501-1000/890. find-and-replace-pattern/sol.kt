class Solution {
    fun findAndReplacePattern(words: Array<String>, pattern: String): List<String> {
        val counts = pattern.map { pattern.indexOf(it) }
        val res = mutableListOf<String>()
        for (word in words) {
            val count = word.map { word.indexOf(it) }
            if (count == counts) {
                res.add(word)
            }
        }
        return res
    }
}
