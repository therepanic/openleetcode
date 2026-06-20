func countPrimes(n int) int {
    if n <= 2 {
        return 0
    }
    isPrime := make([]bool, n)
    for i := range isPrime {
        isPrime[i] = true
    }
    isPrime[0], isPrime[1] = false, false
    for i := 2; i*i < n; i++ {
        if !isPrime[i] {
            continue
        }
        for j := i * i; j < n; j += i {
            isPrime[j] = false
        }
    }
    ans := 0
    for _, x := range isPrime {
        if x {
            ans++
        }
    }
    return ans
}
