class Solution {
    fun judgeSquareSum(c: Int): Boolean {
        var left = 0
        var right = Math.sqrt(c.toDouble()).toInt()
        while (left <= right) {
            val currentSum = left.toLong() * left + right.toLong() * right
            when {
                currentSum == c.toLong() -> return true
                currentSum < c -> left++
                else -> right--
            }
        }
        return false
    }
}
