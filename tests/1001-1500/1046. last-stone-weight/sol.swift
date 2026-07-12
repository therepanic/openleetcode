class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var stones = stones
        while stones.count > 1 {
            stones.sort(by: >)
            let maxStone1 = stones.removeFirst()
            let maxStone2 = stones.removeFirst()
            if maxStone1 != maxStone2 {
                stones.append(maxStone1 - maxStone2)
            }
        }
        return stones.first ?? 0
    }
}
