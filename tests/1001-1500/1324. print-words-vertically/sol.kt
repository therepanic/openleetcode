class Solution {
    fun printVertically(s: String): List<String> {
        val words = s.split(" ")
        val maxLen = words.maxOfOrNull { it.length } ?: 0
        val res = mutableListOf<String>()
        for (i in 0 until maxLen) {
            val sb = StringBuilder()
            for (word in words) {
                if (i < word.length) {
                    sb.append(word[i])
                } else {
                    sb.append(' ')
                }
            }
            res.add(sb.toString().trimEnd())
        }
        return res
    }
}
