class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var leftMax = 0
        var rightMax = 0
        var total = 0

        while left < right {
            leftMax = max(leftMax, height[left])
            rightMax = max(rightMax, height[right])

            if leftMax < rightMax {
                total += leftMax - height[left]
                left += 1
            } else {
                total += rightMax - height[right]
                right -= 1
            }
        }

        return total
    }
}
