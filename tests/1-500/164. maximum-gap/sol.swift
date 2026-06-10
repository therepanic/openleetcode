class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count < 2 { return 0 }
        let nums = nums.sorted()
        var best = 0
        for i in 1..<nums.count {
            best = max(best, nums[i] - nums[i - 1])
        }
        return best
    }
}
