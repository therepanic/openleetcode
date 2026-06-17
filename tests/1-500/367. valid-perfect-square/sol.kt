class Solution {
    fun isPerfectSquare(num: Int): Boolean {
        if (num < 2) {
            return true
        }

        var left = 2L
        var right = (num / 2).toLong()
        while (left <= right) {
            val mid = left + (right - left) / 2
            val squared = mid * mid
            when {
                squared == num.toLong() -> return true
                squared < num -> left = mid + 1
                else -> right = mid - 1
            }
        }

        return false
    }
}
