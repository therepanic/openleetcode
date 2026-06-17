class Solution {
    fun isAdditiveNumber(num: String): Boolean {
        fun addStrings(a: String, b: String): String {
            var i = a.length - 1
            var j = b.length - 1
            var carry = 0
            val out = StringBuilder()
            while (i >= 0 || j >= 0 || carry != 0) {
                var sum = carry
                if (i >= 0) sum += a[i--] - '0'
                if (j >= 0) sum += b[j--] - '0'
                out.append(('0'.code + (sum % 10)).toChar())
                carry = sum / 10
            }
            return out.reverse().toString()
        }

        val n = num.length
        for (i in 1 until n) {
            if (num[0] == '0' && i > 1) break
            for (j in i + 1 until n) {
                if (num[i] == '0' && j > i + 1) break
                var a = num.substring(0, i)
                var b = num.substring(i, j)
                var k = j
                var used = 2
                while (k < n) {
                    val c = addStrings(a, b)
                    if (k + c.length > n || !num.startsWith(c, k)) break
                    k += c.length
                    a = b
                    b = c
                    used++
                }
                if (k == n && used >= 3) return true
            }
        }
        return false
    }
}
