class Solution {
    fun originalDigits(s: String): String {
        val c = IntArray(128)
        for (ch in s) {
            c[ch.code]++
        }
        val d = IntArray(10)
        d[0] = c['z'.code]
        d[2] = c['w'.code]
        d[4] = c['u'.code]
        d[6] = c['x'.code]
        d[8] = c['g'.code]
        d[1] = c['o'.code] - d[0] - d[2] - d[4]
        d[3] = c['h'.code] - d[8]
        d[5] = c['f'.code] - d[4]
        d[7] = c['s'.code] - d[6]
        d[9] = c['i'.code] - d[5] - d[6] - d[8]
        val sb = StringBuilder()
        for (i in 0..9) {
            val digit = i.toString()
            sb.append(digit.repeat(d[i]))
        }
        return sb.toString()
    }
}
