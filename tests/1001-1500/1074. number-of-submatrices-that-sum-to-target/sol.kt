class Solution {
    fun numSubmatrixSumTarget(matrix: Array<IntArray>, target: Int): Int {
        val m = matrix.size
        val n = matrix[0].size
        for (row in 0 until m) {
            for (col in 1 until n) {
                matrix[row][col] += matrix[row][col - 1]
            }
        }
        var count = 0
        for (c1 in 0 until n) {
            for (c2 in c1 until n) {
                val prefixSumMap = mutableMapOf(0 to 1)
                var sumVal = 0
                for (row in 0 until m) {
                    sumVal += matrix[row][c2] - (if (c1 > 0) matrix[row][c1 - 1] else 0)
                    count += prefixSumMap.getOrDefault(sumVal - target, 0)
                    prefixSumMap[sumVal] = prefixSumMap.getOrDefault(sumVal, 0) + 1
                }
            }
        }
        return count
    }
}
