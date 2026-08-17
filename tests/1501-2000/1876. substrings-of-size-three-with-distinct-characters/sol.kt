class Solution {
    fun countGoodSubstrings(s: String): Int {
        val n = s.length
        var count = 0
        for (i in 0..n-3) {
            val sub = s.substring(i, i+3)
            if (sub[0] != sub[1] && sub[1] != sub[2] && sub[0] != sub[2]) {
                count++
            }
        }
        return count
    }
}
