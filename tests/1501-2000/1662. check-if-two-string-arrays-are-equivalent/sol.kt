class Solution {
    fun arrayStringsAreEqual(word1: Array<String>, word2: Array<String>): Boolean {
        val s1 = word1.joinToString("")
        val s2 = word2.joinToString("")
        return s1 == s2
    }
}
