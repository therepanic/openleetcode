func finalPrices(prices []int) []int {
    stack := make([]int, 0, len(prices))
    for i, price := range prices {
        for len(stack) > 0 && prices[stack[len(stack)-1]] >= price {
            index := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            prices[index] -= price
        }
        stack = append(stack, i)
    }
    return prices
}
