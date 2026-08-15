class Solution {
    fun reorderSpaces(text: String): String {
        val words = text.trim().split("\\s+".toRegex())
        val total = text.count { it == ' ' }
        if (words.size == 1) {
            return words[0] + " ".repeat(total)
        }
        val gap = total / (words.size - 1)
        val extra = total % (words.size - 1)
        return words.joinToString(" ".repeat(gap)) + " ".repeat(extra)
    }
}
