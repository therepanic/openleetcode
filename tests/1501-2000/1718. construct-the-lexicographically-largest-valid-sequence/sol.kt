class Solution {
    fun constructDistancedSequence(n: Int): IntArray {
        val result = IntArray(2 * n - 1)
        val used = BooleanArray(n + 1)
        backtrack(result, used, n, 0)
        return result
    }

    private fun backtrack(result: IntArray, used: BooleanArray, n: Int, index: Int): Boolean {
        var idx = index
        while (idx < result.size && result[idx] != 0) {
            idx++
        }
        if (idx == result.size) return true

        for (i in n downTo 1) {
            if (used[i]) continue

            if (i == 1) {
                result[idx] = 1
                used[1] = true
                if (backtrack(result, used, n, idx + 1)) return true
                result[idx] = 0
                used[1] = false
            } else if (idx + i < result.size && result[idx + i] == 0) {
                result[idx] = i
                result[idx + i] = i
                used[i] = true
                if (backtrack(result, used, n, idx + 1)) return true
                result[idx] = 0
                result[idx + i] = 0
                used[i] = false
            }
        }

        return false
    }
}
