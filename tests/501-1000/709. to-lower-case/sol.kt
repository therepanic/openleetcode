class Solution {
    fun toLowerCase(s: String): String {
        val result = StringBuilder()
        for (ch in s) {
            if (ch.code in 65..90) {
                result.append((ch.code + 32).toChar())
            } else {
                result.append(ch)
            }
        }
        return result.toString()
    }
}
