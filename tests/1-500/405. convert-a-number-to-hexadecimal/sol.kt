class Solution {
    fun toHex(num: Int): String {
        if (num == 0) return "0"
        var n = num.toLong()
        if (n < 0) n += (1L shl 32)
        val h = "0123456789abcdef"
        val r = StringBuilder()
        while (n > 0) {
            r.append(h[(n and 15).toInt()])
            n /= 16
        }
        return r.reverse().toString()
    }
}
