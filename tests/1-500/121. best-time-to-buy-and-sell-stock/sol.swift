class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var best = 0
        var minPrice = Int.max
        for price in prices {
            minPrice = Swift.min(minPrice, price)
            best = Swift.max(best, price - minPrice)
        }
        return best
    }
}
