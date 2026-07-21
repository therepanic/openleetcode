class Solution {
    fun freqAlphabets(s: String): String {
        val decoded = StringBuilder()
        var index = 0
        while (index < s.length) {
            if (index + 2 < s.length && s[index + 2] == '#') {
                val num = s.substring(index, index + 2).toInt()
                decoded.append(('a' + num - 1))
                index += 3
            } else {
                val num = s[index] - '0'
                decoded.append(('a' + num - 1))
                index += 1
            }
        }
        return decoded.toString()
    }
}
