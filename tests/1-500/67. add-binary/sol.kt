class Solution {
    fun addBinary(a: String, b: String): String {
        val res = StringBuilder()
        var i = a.length - 1
        var j = b.length - 1
        var carry = 0

        while (i >= 0 || j >= 0 || carry > 0) {
            var sum = carry
            if (i >= 0) {
                sum += a[i] - '0'
                i--
            }
            if (j >= 0) {
                sum += b[j] - '0'
                j--
            }
            res.append(('0'.code + (sum % 2)).toChar())
            carry = sum / 2
        }

        return res.reverse().toString()
    }
}
