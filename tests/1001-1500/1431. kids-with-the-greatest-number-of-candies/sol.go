func kidsWithCandies(candies []int, extraCandies int) []bool {
    currentMax := candies[0]
    for _, candy := range candies {
        if candy > currentMax {
            currentMax = candy
        }
    }
    result := make([]bool, len(candies))
    for i, candyCount := range candies {
        if candyCount+extraCandies >= currentMax {
            result[i] = true
        } else {
            result[i] = false
        }
    }
    return result
}
