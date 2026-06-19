class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        let median = sorted[sorted.count / 2]
        var moves = 0
        for num in sorted {
            moves += abs(num - median)
        }
        return moves
    }
}
