class Solution {
    fun maxArea(height: IntArray): Int {
        var left = 0
        var right = height.lastIndex
        var ans = 0

        while (left < right) {
            ans = maxOf(ans, minOf(height[left], height[right]) * (right - left))
            if (height[left] < height[right]) {
                left++
            } else {
                right--
            }
        }

        return ans
    }
}
