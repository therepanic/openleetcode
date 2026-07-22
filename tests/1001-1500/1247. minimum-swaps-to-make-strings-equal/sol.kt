class Solution {
    fun minimumSwap(s1: String, s2: String): Int {
        val n = s1.length
        var s1X = 0
        var s1Y = 0
        for (i in 0 until n) {
            if (s1[i] == s2[i]) continue
            if (s1[i] == 'x') s1X++ else s1Y++
        }

        if (s1X % 2 != s1Y % 2) return -1

        val swaps = s1X / 2 + s1Y / 2
        return if (s1X % 2 == 0) swaps else swaps + 2
    }
}
