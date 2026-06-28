class Solution {
    fun findKthNumber(m: Int, n: Int, k: Int): Int {
        var lo = 1
        var hi = m * n
        while (lo < hi) {
            val mid = lo + (hi - lo) / 2
            var count = 0
            for (i in 1..m) {
                count += if (n < mid / i) n else mid / i
            }
            if (count >= k) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}
