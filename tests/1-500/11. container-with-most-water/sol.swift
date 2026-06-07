class Solution {
    func maxArea(_ height: [Int]) -> Int {
        if height.count < 2 { return 0 }
        var left = 0
        var right = height.count - 1
        var ans = 0
        while left < right {
            ans = max(ans, min(height[left], height[right]) * (right - left))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return ans
    }
}
