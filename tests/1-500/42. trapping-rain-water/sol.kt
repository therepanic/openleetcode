class Solution {
    fun trap(height: IntArray): Int {
        var left = 0
        var right = height.size - 1
        var leftMax = 0
        var rightMax = 0
        var total = 0

        while (left < right) {
            leftMax = max(leftMax, height[left])
            rightMax = max(rightMax, height[right])

            if (leftMax < rightMax) {
                total += leftMax - height[left]
                left++
            } else {
                total += rightMax - height[right]
                right--
            }
        }

        return total
    }
}
