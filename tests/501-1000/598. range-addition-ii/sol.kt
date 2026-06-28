class Solution {
    fun maxCount(m: Int, n: Int, ops: Array<IntArray>): Int {
        if (ops.isEmpty()) {
            return m * n
        }
        var minM = m
        var minN = n
        for (op in ops) {
            minM = minOf(minM, op[0])
            minN = minOf(minN, op[1])
        }
        return minM * minN
    }
}
