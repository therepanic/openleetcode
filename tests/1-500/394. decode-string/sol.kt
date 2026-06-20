class Solution {
    private var i = 0
    
    fun decodeString(s: String): String {
        return decode(s)
    }
    
    private fun decode(s: String): String {
        val res = StringBuilder()
        var num = 0
        while (i < s.length) {
            val c = s[i]
            if (c.isDigit()) {
                num = num * 10 + (c - '0')
                i++
            } else if (c == '[') {
                i++
                val inner = decode(s)
                repeat(num) { res.append(inner) }
                num = 0
            } else if (c == ']') {
                i++
                return res.toString()
            } else {
                res.append(c)
                i++
            }
        }
        return res.toString()
    }
}
