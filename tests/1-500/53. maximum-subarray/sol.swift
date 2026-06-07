class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var best = nums[0]
        var cur = 0
        for n in nums {
            if cur < 0 { cur = 0 }
            cur += n
            if cur > best { best = cur }
        }
        return best
    }
}
