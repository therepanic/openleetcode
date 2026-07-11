func hasGroupsSizeX(deck []int) bool {
    counts := make(map[int]int)
    for _, card := range deck {
        counts[card]++
    }
    
    var gcd func(a, b int) int
    gcd = func(a, b int) int {
        for b > 0 {
            a, b = b, a%b
        }
        return a
    }
    
    currentGcd := -1
    for _, count := range counts {
        if currentGcd == -1 {
            currentGcd = count
        } else {
            currentGcd = gcd(currentGcd, count)
            if currentGcd == 1 {
                return false
            }
        }
    }
    
    return currentGcd >= 2
}
