func nthSuperUglyNumber(n int, primes []int) int {
    ugly := make([]int, n)
    ugly[0] = 1
    idx := make([]int, len(primes))
    val := make([]int, len(primes))
    copy(val, primes)
    for i := 1; i < n; i++ {
        m := val[0]
        for _, v := range val {
            if v < m {
                m = v
            }
        }
        ugly[i] = m
        for j, p := range primes {
            if val[j] == m {
                idx[j]++
                val[j] = ugly[idx[j]] * p
            }
        }
    }
    return ugly[n-1]
}
