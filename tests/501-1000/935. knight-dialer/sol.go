func knightDialer(n int) int {
    if n == 1 {
        return 10
    }
    
    dp := make([]int, 10)
    for i := range dp {
        dp[i] = 1
    }
    
    mapping := [][]int{
        {4, 6},
        {6, 8},
        {7, 9},
        {4, 8},
        {0, 3, 9},
        {},
        {0, 1, 7},
        {2, 6},
        {1, 3},
        {2, 4},
    }
    
    MOD := 1000000007
    
    for step := 0; step < n-1; step++ {
        newDp := make([]int, 10)
        for i := 0; i < 10; i++ {
            for _, digit := range mapping[i] {
                newDp[digit] = (newDp[digit] + dp[i]) % MOD
            }
        }
        dp = newDp
    }
    
    sum := 0
    for _, val := range dp {
        sum = (sum + val) % MOD
    }
    return sum
}
