class Solution {
    fun nthUglyNumber(n: Int): Int {
        val h = IntArray(n)
        h[0] = 1
        var i = 0
        var j = 0
        var k = 0

        for (idx in 1 until n) {
            val m = minOf(h[i] * 2, h[j] * 3, h[k] * 5)
            h[idx] = m

            if (m == h[i] * 2) i++
            if (m == h[j] * 3) j++
            if (m == h[k] * 5) k++
        }

        return h[n - 1]
    }
}
