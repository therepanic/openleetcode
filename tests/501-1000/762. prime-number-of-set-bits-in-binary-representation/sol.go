func countPrimeSetBits(left int, right int) int {
    count := 0
    for i := left; i <= right; i++ {
        setBits := 0
        n := i
        for n > 0 {
            setBits += n & 1
            n >>= 1
        }
        if isPrime(setBits) {
            count++
        }
    }
    return count
}

func isPrime(n int) bool {
    if n <= 1 {
        return false
    }
    for i := 2; i*i <= n; i++ {
        if n%i == 0 {
            return false
        }
    }
    return true
}
