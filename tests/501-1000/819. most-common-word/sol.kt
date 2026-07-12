class Solution {
    fun mostCommonWord(paragraph: String, banned: Array<String>): String {
        val bannedSet = banned.toSet()
        val counts = mutableMapOf<String, Int>()
        paragraph.lowercase().split(Regex("[^a-z]+")).forEach { w ->
            if (w.isNotEmpty() && w !in bannedSet) {
                counts[w] = counts.getOrDefault(w, 0) + 1
            }
        }
        return counts.maxByOrNull { it.value }!!.key
    }
}
