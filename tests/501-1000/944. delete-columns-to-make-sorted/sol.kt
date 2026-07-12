class Solution {
    fun minDeletionSize(strs: Array<String>): Int {
        val rows = strs.size
        val cols = strs[0].length
        var deletions = 0

        for (c in 0 until cols) {
            for (r in 0 until rows - 1) {
                if (strs[r][c] > strs[r + 1][c]) {
                    deletions++
                    break
                }
            }
        }

        return deletions
    }
}
