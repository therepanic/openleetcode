class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var c = nums[0]
        var s = 0
        for i in 1..<nums.count {
            if nums[i] > c {
                c = nums[i]
            } else {
                c += 1
                s += c - nums[i]
            }
        }
        return s
    }
}
