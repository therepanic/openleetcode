class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        var buy1 = -prices[0]
        var sell1 = 0
        var buy2 = -prices[0]
        var sell2 = 0
        for price in prices.dropFirst() {
            buy1 = Swift.max(buy1, -price)
            sell1 = Swift.max(sell1, buy1 + price)
            buy2 = Swift.max(buy2, sell1 - price)
            sell2 = Swift.max(sell2, buy2 + price)
        }
        return sell2
    }
}
