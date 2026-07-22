class Solution {
    fun arrangeWords(text: String): String {
        val s = text.split(" ").toMutableList()
        s.sortBy { it.length }
        for (i in s.indices) {
            s[i] = s[i].lowercase()
        }
        s[0] = s[0][0].uppercase() + s[0].substring(1)
        return s.joinToString(" ")
    }
}
