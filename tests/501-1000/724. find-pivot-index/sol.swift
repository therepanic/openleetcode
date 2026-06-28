class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let totalSum = nums.reduce(0, +)
        var lSum = 0
        var rSum = totalSum
        for i in 0..<nums.count {
            rSum -= nums[i]
            if lSum == rSum {
                return i
            }
            lSum += nums[i]
        }
        return -1
    }
}
