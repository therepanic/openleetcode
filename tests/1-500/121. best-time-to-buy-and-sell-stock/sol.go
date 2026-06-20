func maxProfit(prices []int) int {
    best := 0
    minPrice := int(^uint(0) >> 1)
    for _, price := range prices {
        if price < minPrice {
            minPrice = price
        }
        if price-minPrice > best {
            best = price - minPrice
        }
    }
    return best
}
