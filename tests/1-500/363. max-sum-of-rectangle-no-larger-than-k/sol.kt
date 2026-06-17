class Solution {
    fun maxSumSubmatrix(matrix: Array<IntArray>, k: Int): Int {
        val m = matrix.size
        val n = matrix[0].size
        var ans = Int.MIN_VALUE
        for (left in 0 until n) {
            val rowSum = IntArray(m)
            for (right in left until n) {
                for (i in 0 until m) {
                    rowSum[i] += matrix[i][right]
                }
                val set = sortedSetOf(0)
                var curr = 0
                for (x in rowSum) {
                    curr += x
                    val target = curr - k
                    var idx = 0
                    for (v in set) {
                        if (v >= target) break
                        idx++
                    }
                    if (idx < set.size) {
                        ans = maxOf(ans, curr - set.elementAt(idx))
                    }
                    set.add(curr)
                }
            }
        }
        return ans
    }
}
