class Solution {
    fun atMostNGivenDigitSet(digits: Array<String>, n: Int): Int {
        val d = digits.size
        val s = n.toString()
        val k = s.length
        val vals = digits.map { it[0] }

        fun powInt(base: Int, exp: Int): Int {
            var out = 1
            repeat(exp) { out *= base }
            return out
        }

        var ans = 0
        for (len in 1 until k) {
            ans += powInt(d, len)
        }

        for (i in s.indices) {
            val ch = s[i]
            val cnt = digits.count { it[0] < ch }
            ans += cnt * powInt(d, k - i - 1)

            if (ch !in vals) {
                return ans
            }
            if (i == k - 1) {
                ans++
            }
        }

        return ans
    }
}
