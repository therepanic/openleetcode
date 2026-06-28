class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var nums = nums
        var cntViolations = 0
        for i in 1..<nums.count {
            if nums[i] < nums[i - 1] {
                if cntViolations == 1 {
                    return false
                }
                cntViolations += 1
                if i >= 2 && nums[i - 2] > nums[i] {
                    nums[i] = nums[i - 1]
                }
            }
        }
        return true
    }
}
