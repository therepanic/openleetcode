class Solution {
    fun minDifference(nums: IntArray, queries: Array<IntArray>): IntArray {
        val maxVal = nums.maxOrNull() ?: 0
        val p = Array(nums.size + 1) { IntArray(maxVal + 1) }
        for (j in 0..maxVal) p[0][j] = 0
        for (i in nums.indices) {
            for (j in 0..maxVal) {
                p[i + 1][j] = p[i][j] + if (nums[i] == j) 1 else 0
            }
        }
        val res = IntArray(queries.size)
        for (qi in queries.indices) {
            val l = queries[qi][0]
            val r = queries[qi][1]
            val diff = IntArray(maxVal + 1)
            for (j in 0..maxVal) diff[j] = p[r + 1][j] - p[l][j]
            var prev = -1
            var best = -1
            for (j in 0..maxVal) {
                if (diff[j] > 0) {
                    if (prev >= 0) {
                        if (best == -1 || j - prev < best) best = j - prev
                    }
                    prev = j
                }
            }
            res[qi] = best
        }
        return res
    }
}
