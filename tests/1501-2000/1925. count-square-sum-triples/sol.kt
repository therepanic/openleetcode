class Solution {
    fun countTriples(n: Int): Int {
        var cnt = 0
        val nsqrt = Math.sqrt(n.toDouble()).toInt()
        for (s in 2..nsqrt) {
            val start = (s and 1) + 1
            var t = start
            while (t < s) {
                if (gcd(s, t) != 1) { t += 2; continue }
                val c = s * s + t * t
                if (c > n) break
                val k = n / c
                cnt += 2 * k
                t += 2
            }
        }
        return cnt
    }
    private fun gcd(a: Int, b: Int): Int {
        var x = a
        var y = b
        while (y != 0) {
            val temp = y
            y = x % y
            x = temp
        }
        return x
    }
}
