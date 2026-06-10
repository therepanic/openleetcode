class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        if prices.count < 2 {
            return 0
        }
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                profit += prices[i] - prices[i - 1]
            }
        }
        return profit
    }
}
