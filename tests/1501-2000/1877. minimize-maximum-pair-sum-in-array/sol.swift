class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var maxSum = 0
        var l = 0
        var r = nums.count - 1
        while l < r {
            maxSum = max(maxSum, nums[l] + nums[r])
            l += 1
            r -= 1
        }
        return maxSum
    }
}
