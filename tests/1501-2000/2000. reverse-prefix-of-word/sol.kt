class Solution {
    fun reversePrefix(word: String, ch: Char): String {
        val idx = word.indexOf(ch)
        if (idx == -1) {
            return word
        }
        val sb = StringBuilder()
        sb.append(word.substring(0, idx + 1)).reverse()
        sb.append(word.substring(idx + 1))
        return sb.toString()
    }
}
