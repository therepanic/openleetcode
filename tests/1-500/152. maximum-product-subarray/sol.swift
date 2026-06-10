class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var best = nums[0]
        var curMax = nums[0]
        var curMin = nums[0]
        for i in 1..<nums.count {
            let x = nums[i]
            if x < 0 {
                swap(&curMax, &curMin)
            }
            curMax = max(x, curMax * x)
            curMin = min(x, curMin * x)
            best = max(best, curMax)
        }
        return best
    }
}
