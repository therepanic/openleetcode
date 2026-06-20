func integerBreak(n int) int {
    if n == 2 {
        return 1
    }
    if n == 3 {
        return 2
    }
    
    threes := n / 3
    remainder := n % 3
    
    if remainder == 1 {
        threes -= 1
        remainder = 4
    } else if remainder == 0 {
        remainder = 1
    }
    
    result := 1
    for i := 0; i < threes; i++ {
        result *= 3
    }
    return result * remainder
}
