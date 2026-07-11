class Solution {
    fun baseNeg2(n: Int): String {
        if (n == 0) {
            return "0"
        }
        var num = n
        val res = StringBuilder()
        while (num != 0) {
            val digit = num and 1
            res.append(('0'.code + digit).toChar())
            num = (num - digit) / -2
        }
        return res.reverse().toString()
    }
}
