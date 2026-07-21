func numOfWays(n int) int {
    const MOD = 1000000007
    x, y := 6, 6
    
    for i := 2; i <= n; i++ {
        newX := (3*x + 2*y) % MOD
        newY := (2*x + 2*y) % MOD
        x, y = newX, newY
    }
    
    return (x + y) % MOD
}
