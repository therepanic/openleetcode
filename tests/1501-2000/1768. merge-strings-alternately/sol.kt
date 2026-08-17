class Solution {
    fun mergeAlternately(word1: String, word2: String): String {
        val merged = StringBuilder()
        val minLen = minOf(word1.length, word2.length)
        for (i in 0 until minLen) {
            merged.append(word1[i]).append(word2[i])
        }
        if (word1.length > minLen) {
            merged.append(word1.substring(minLen))
        }
        if (word2.length > minLen) {
            merged.append(word2.substring(minLen))
        }
        return merged.toString()
    }
}
