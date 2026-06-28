func maxProfit(prices []int, fee int) int {
    hold := -prices[0]
    cash := 0

    for _, price := range prices[1:] {
        cash = max(cash, hold + price - fee)
        hold = max(hold, cash - price)
    }

    return cash
}
