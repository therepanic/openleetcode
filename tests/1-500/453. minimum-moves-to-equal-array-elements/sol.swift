class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        let min = nums.min()!
        return sum - nums.count * min
    }
}
