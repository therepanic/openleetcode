class Solution {
    func findMiddleIndex(_ nums: [Int]) -> Int {
        let total = nums.reduce(0, +)
        var leftSum = 0
        var rightSum = total
        
        for i in 0..<nums.count {
            rightSum -= nums[i]
            if leftSum == rightSum {
                return i
            }
            leftSum += nums[i]
        }
        
        return -1
    }
}
