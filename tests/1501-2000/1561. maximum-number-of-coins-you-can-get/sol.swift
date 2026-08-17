class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        var piles = piles.sorted()
        var l = 0
        var r = piles.count
        var count = 0
        for _ in 0..<(piles.count/3) {
            count += piles[r-2]
            l += 1
            r -= 2
        }
        return count
    }
}
