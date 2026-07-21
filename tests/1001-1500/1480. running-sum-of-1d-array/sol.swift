class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var nums = nums
        for i in 1..<nums.count {
            nums[i] += nums[i - 1]
        }
        return nums
    }
}
