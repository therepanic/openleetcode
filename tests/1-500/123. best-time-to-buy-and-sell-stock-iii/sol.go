func maxProfit(prices []int) int {
    if len(prices) == 0 {
        return 0
    }
    buy1 := -prices[0]
    sell1 := 0
    buy2 := -prices[0]
    sell2 := 0
    for i := 1; i < len(prices); i++ {
        price := prices[i]
        if -price > buy1 {
            buy1 = -price
        }
        if buy1+price > sell1 {
            sell1 = buy1 + price
        }
        if sell1-price > buy2 {
            buy2 = sell1 - price
        }
        if buy2+price > sell2 {
            sell2 = buy2 + price
        }
    }
    return sell2
}
