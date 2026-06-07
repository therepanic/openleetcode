class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var farthest = 0
        for (i, n) in nums.enumerated() {
            if i > farthest {
                return false
            }
            if i + n > farthest {
                farthest = i + n
            }
            if farthest >= nums.count - 1 {
                return true
            }
        }
        return true
    }
}
