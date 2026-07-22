class Solution {
    fun numberOfSubstrings(s: String): Int {
        var res = 0
        val p = intArrayOf(50000, -1, -1, -1)
        for (i in s.indices) {
            p[s[i].code and 31] = i
            res += minOf(p[1], p[2], p[3]) + 1
        }
        return res
    }
}
