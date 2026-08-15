class Solution {
    fun areOccurrencesEqual(s: String): Boolean {
        val map = mutableMapOf<Char, Int>()
        for (c in s) {
            map[c] = map.getOrDefault(c, 0) + 1
        }
        return map.values.toSet().size == 1
    }
}
