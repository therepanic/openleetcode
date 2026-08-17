class Solution {
    fun thousandSeparator(n: Int): String {
        val s = n.toString()
        if (s.length <= 3) return s
        val sb = StringBuilder()
        var count = 0
        for (i in s.length - 1 downTo 0) {
            sb.append(s[i])
            count++
            if (count % 3 == 0 && i > 0) {
                sb.append('.')
            }
        }
        return sb.reverse().toString()
    }
}
