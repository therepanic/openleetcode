class Solution {
    fun minDeletionSize(strs: Array<String>): Int {
        val n = strs.size
        val m = strs[0].length
        val sortedPairs = BooleanArray(n - 1)
        var delCount = 0

        for (col in 0 until m) {
            var bad = false
            for (i in 0 until n - 1) {
                if (!sortedPairs[i] && strs[i][col] > strs[i + 1][col]) {
                    bad = true
                    break
                }
            }

            if (bad) {
                delCount++
                continue
            }

            for (i in 0 until n - 1) {
                if (!sortedPairs[i] && strs[i][col] < strs[i + 1][col]) {
                    sortedPairs[i] = true
                }
            }

            if (sortedPairs.all { it }) break
        }

        return delCount
    }
}
