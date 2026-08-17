class Solution {
    fun minFlips(s: String): Int {
        val n = s.length
        val t = s + s
        var ans = n
        var mis0 = 0

        for (i in 0 until 2 * n) {
            val expected0 = if (i % 2 == 0) '0' else '1'
            if (t[i] != expected0) {
                mis0++
            }

            if (i >= n) {
                val left = i - n
                val expLeft = if (left % 2 == 0) '0' else '1'
                if (t[left] != expLeft) {
                    mis0--
                }
            }

            if (i >= n - 1) {
                val mis1 = n - mis0
                ans = minOf(ans, minOf(mis0, mis1))
            }
        }

        return ans
    }
}
