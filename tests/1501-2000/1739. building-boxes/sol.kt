class Solution {
    fun minimumBoxes(n: Int): Int {
        var lo = 0L
        var hi = 200000L
        val target = n.toLong()
        while (lo < hi) {
            val mid = (lo + hi + 1) / 2
            if (mid * (mid + 1) * (mid + 2) / 6 <= target) lo = mid else hi = mid - 1
        }
        val remaining = target - lo * (lo + 1) * (lo + 2) / 6
        var extra = 0L
        while (extra * (extra + 1) / 2 < remaining) extra++
        return (lo * (lo + 1) / 2 + extra).toInt()
    }
}
