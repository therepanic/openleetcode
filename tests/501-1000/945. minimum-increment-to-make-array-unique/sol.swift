class Solution {
    func minIncrementForUnique(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var res = 0
        for i in 1..<nums.count {
            if nums[i] <= nums[i - 1] {
                let target = nums[i - 1] + 1
                res += target - nums[i]
                nums[i] = target
            }
        }
        return res
    }
}
