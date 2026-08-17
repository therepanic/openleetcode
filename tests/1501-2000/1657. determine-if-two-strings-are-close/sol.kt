class Solution {
    fun closeStrings(word1: String, word2: String): Boolean {
        if (word1.length != word2.length) return false
        val set1 = word1.toSet()
        val set2 = word2.toSet()
        if (set1 != set2) return false
        val dct = mutableMapOf<Int, Int>()
        for (x in set1) {
            val n1 = word1.count { it == x }
            val n2 = word2.count { it == x }
            dct[n1] = dct.getOrDefault(n1, 0) + 1
            dct[n2] = dct.getOrDefault(n2, 0) - 1
        }
        return dct.values.all { it == 0 }
    }
}
