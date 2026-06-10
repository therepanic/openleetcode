class Solution {
    func rob(_ nums: [Int]) -> Int {
        var next1 = 0
        var next2 = 0
        var i = nums.count - 1
        while i >= 0 {
            let curr = max(nums[i] + next2, next1)
            next2 = next1
            next1 = curr
            i -= 1
        }
        return next1
    }
}
