class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var res = 0
        var left = 0
        for right in 0..<nums.count {
            if nums[right] == 0 {
                left = right + 1
            } else {
                res = max(res, right - left + 1)
            }
        }
        return res
    }
}
