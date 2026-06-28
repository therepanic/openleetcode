func preimageSizeFZF(k int) int {
    trailingZeroes := func(n int) int {
        count := 0
        power := 5
        for power <= n {
            count += n / power
            power *= 5
        }
        return count
    }
    
    start := k * 4
    for {
        H := trailingZeroes(start)
        if H == k {
            return 5
        }
        if H > k {
            break
        }
        start++
    }
    return 0
}
