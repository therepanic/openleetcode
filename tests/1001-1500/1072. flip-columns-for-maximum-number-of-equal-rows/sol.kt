class Solution {
    fun maxEqualRowsAfterFlips(matrix: Array<IntArray>): Int {
        val count = mutableMapOf<String, Int>()
        var ans = 0

        for (row in matrix) {
            val flip = row[0]
            val key = row.joinToString(",") { (it xor flip).toString() }
            val valCount = count.getOrDefault(key, 0) + 1
            count[key] = valCount
            if (valCount > ans) ans = valCount
        }

        return ans
    }
}
