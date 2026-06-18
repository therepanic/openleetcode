func nthSuperUglyNumber(n int, primes []int) int {
    ugly := make([]int, n)
    ugly[0] = 1
    idx := make([]int, len(primes))
    val := make([]int64, len(primes))
    for i, p := range primes {
        val[i] = int64(p)
    }
    for i := 1; i < n; i++ {
        m := val[0]
        for j := 1; j < len(val); j++ {
            v := val[j]
            if v < m {
                m = v
            }
        }
        ugly[i] = int(m)
        for j, p := range primes {
            if val[j] == m {
                idx[j]++
                val[j] = int64(ugly[idx[j]]) * int64(p)
            }
        }
    }
    return ugly[n-1]
}
