class Solution {
    fun maxValue(n: Int, index: Int, maxSum: Int): Int {
        var l = 0L
        var r = maxSum.toLong()
        var result = 1L
        while (l <= r) {
            val mid = (l + r) / 2
            if (isValid(mid, n, index, maxSum)) {
                result = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return result.toInt()
    }

    private fun isValid(mid: Long, n: Int, index: Int, maxSum: Int): Boolean {
        val leftCount = index.toLong()
        val left: Long
        if (mid > leftCount) {
            left = (mid - leftCount + mid - 1) * leftCount / 2
        } else {
            val ones = leftCount - (mid - 1)
            left = mid * (mid - 1) / 2 + ones
        }

        val rightCount = (n - index - 1).toLong()
        val right: Long
        if (mid > rightCount) {
            right = (mid - 1 + mid - rightCount) * rightCount / 2
        } else {
            val ones = rightCount - (mid - 1)
            right = mid * (mid - 1) / 2 + ones
        }

        return left + mid + right <= maxSum
    }
}
