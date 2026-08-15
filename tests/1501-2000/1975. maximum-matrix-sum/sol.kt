class Solution {
    fun maxMatrixSum(matrix: Array<IntArray>): Long {
        var totalSum = 0L
        var neg = 0
        var minAbs = Int.MAX_VALUE
        for (row in matrix) {
            for (v in row) {
                if (v < 0) neg++
                val av = Math.abs(v)
                totalSum += av
                minAbs = Math.min(minAbs, av)
            }
        }
        return if (neg % 2 == 0) totalSum else totalSum - 2L * minAbs
    }
}
