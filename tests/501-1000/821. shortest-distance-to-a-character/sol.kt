class Solution {
    fun shortestToChar(s: String, c: Char): IntArray {
        val n = s.length
        val ans = IntArray(n)
        var prev = -n
        for (i in 0 until n) {
            if (s[i] == c) {
                prev = i
            }
            ans[i] = i - prev
        }
        prev = 2 * n
        for (i in n - 1 downTo 0) {
            if (s[i] == c) {
                prev = i
            }
            ans[i] = minOf(ans[i], prev - i)
        }
        return ans
    }
}
