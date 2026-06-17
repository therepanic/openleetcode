class Solution {
    fun hIndex(citations: IntArray): Int {
        val n = citations.size
        var l = 0
        var r = n
        while (l < r) {
            val m = (l + r + 1) / 2
            if (citations[n - m] >= m) {
                l = m
            } else {
                r = m - 1
            }
        }
        return l
    }
}
