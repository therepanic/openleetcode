class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var even = 0, odd = 0
        for i in position {
            if i % 2 == 0 {
                even += 1
            } else {
                odd += 1
            }
        }
        return min(even, odd)
    }
}
