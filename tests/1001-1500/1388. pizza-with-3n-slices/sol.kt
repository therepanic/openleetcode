class Solution {
    fun maxSizeSlices(slices: IntArray): Int {
        val n = slices.size
        val m = n / 3
        return maxOf(
            dp(slices, 0, n - 2, m),
            dp(slices, 1, n - 1, m)
        )
    }

    private fun dp(slices: IntArray, start: Int, end: Int, m: Int): Int {
        val k = end - start + 1
        val dpTable = Array(k + 1) { IntArray(m + 1) }
        for (i in 1..k) {
            for (j in 1..minOf(i, m)) {
                dpTable[i][j] = maxOf(
                    dpTable[i - 1][j],
                    (if (i > 1) dpTable[i - 2][j - 1] else 0) + slices[start + i - 1]
                )
            }
        }
        return dpTable[k][m]
    }
}
