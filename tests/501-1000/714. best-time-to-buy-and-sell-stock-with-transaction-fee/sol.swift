class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var hold = -prices[0]
        var cash = 0

        for i in 1..<prices.count {
            cash = max(cash, hold + prices[i] - fee)
            hold = max(hold, cash - prices[i])
        }

        return cash
    }
}
