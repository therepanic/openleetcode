class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        let n = nums.count
        var count = 0
        for i in stride(from: n - 1, through: 0, by: -1) {
            var left = 0
            var right = i - 1
            while left < right {
                if nums[left] + nums[right] > nums[i] {
                    count += right - left
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return count
    }
}
