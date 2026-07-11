class Solution {
    func numMovesStones(_ a: Int, _ b: Int, _ c: Int) -> [Int] {
        let stones = [a, b, c].sorted()
        let x = stones[0], y = stones[1], z = stones[2]
        let minMove: Int
        if z - x == 2 {
            minMove = 0
        } else if y - x <= 2 || z - y <= 2 {
            minMove = 1
        } else {
            minMove = 2
        }
        let maxMove = z - x - 2
        return [minMove, maxMove]
    }
}
