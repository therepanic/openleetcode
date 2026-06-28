class Solution {
    func isIdealPermutation(_ nums: [Int]) -> Bool {
        for (i, num) in nums.enumerated() {
            if abs(num - i) > 1 {
                return false
            }
        }
        return true
    }
}
