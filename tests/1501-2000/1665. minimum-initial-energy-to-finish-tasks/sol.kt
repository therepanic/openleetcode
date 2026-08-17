class Solution {
    fun minimumEffort(tasks: Array<IntArray>): Int {
        tasks.sortByDescending { it[1] - it[0] }
        fun test(bal: Int): Boolean {
            var b = bal
            for ((cost, thresh) in tasks) {
                if (b < thresh) return false
                b -= cost
            }
            return true
        }
        var lo = 0
        var hi = 1000000001
        while (lo < hi) {
            val mid = (lo + hi) / 2
            if (test(mid)) hi = mid else lo = mid + 1
        }
        return lo
    }
}
