class Solution {
    fun countHomogenous(s: String): Int {
        val mod = 1_000_000_007L
        val n = s.length
        var res = 1L
        var cnt = 1
        for (i in 1 until n) {
            if (s[i] != s[i - 1]) {
                cnt = 0
            }
            cnt++
            res = (res + cnt) % mod
        }
        return res.toInt()
    }
}
