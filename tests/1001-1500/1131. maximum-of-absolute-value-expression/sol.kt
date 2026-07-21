class Solution {
    fun maxAbsValExpr(arr1: IntArray, arr2: IntArray): Int {
        var res = 0
        val n = arr1.size
        val signs = arrayOf(intArrayOf(1, 1), intArrayOf(1, -1), intArrayOf(-1, 1), intArrayOf(-1, -1))

        for (sign in signs) {
            val p = sign[0]
            val q = sign[1]
            var maxVal = Int.MIN_VALUE
            var minVal = Int.MAX_VALUE
            for (i in 0 until n) {
                val value = p * arr1[i] + q * arr2[i] + i
                maxVal = maxOf(maxVal, value)
                minVal = minOf(minVal, value)
            }
            res = maxOf(res, maxVal - minVal)
        }

        return res
    }
}
