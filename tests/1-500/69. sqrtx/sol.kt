class Solution {
    fun mySqrt(x: Int): Int {
        if (x < 2) {
            return x
        }

        var left = 1L
        var right = x.toLong() / 2
        var ans = 1

        while (left <= right) {
            val mid = left + (right - left) / 2
            val square = mid * mid
            if (square == x.toLong()) {
                return mid.toInt()
            }
            if (square < x.toLong()) {
                ans = mid.toInt()
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return ans
    }
}
