class Solution {
    fun maxSideLength(mat: Array<IntArray>, threshold: Int): Int {
        val n = mat.size
        val m = mat[0].size
        val pref = Array(n) { mat[it].copyOf() }
        for (i in 0 until n) {
            for (j in 1 until m) {
                pref[i][j] += pref[i][j - 1]
            }
        }
        for (j in 0 until m) {
            for (i in 1 until n) {
                pref[i][j] += pref[i - 1][j]
            }
        }
        fun isValid(k: Int): Boolean {
            for (i in k - 1 until n) {
                for (j in k - 1 until m) {
                    val x1 = i - k + 1
                    val y1 = j - k + 1
                    var total = pref[i][j]
                    if (x1 > 0) total -= pref[x1 - 1][j]
                    if (y1 > 0) total -= pref[i][y1 - 1]
                    if (x1 > 0 && y1 > 0) total += pref[x1 - 1][y1 - 1]
                    if (total <= threshold) return true
                }
            }
            return false
        }
        var low = 1
        var high = minOf(n, m)
        var ans = 0
        while (low <= high) {
            val mid = (low + high) / 2
            if (isValid(mid)) {
                ans = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return ans
    }
}
