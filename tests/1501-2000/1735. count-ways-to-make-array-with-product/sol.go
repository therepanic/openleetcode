func waysToFillArray(queries [][]int) []int {
    const mod = int64(1e9 + 7)
    ans := make([]int, len(queries))
    
    for idx, q := range queries {
        n, k := q[0], q[1]
        primes := primeFactors(k)
        total := int64(1)
        for _, cnt := range primes {
            total = total * comb(n+cnt-1, n-1) % mod
        }
        ans[idx] = int(total)
    }
    return ans
}

func primeFactors(n int) []int {
    factors := []int{}
    p := 2
    for p*p <= n {
        count := 0
        for n%p == 0 {
            count++
            n /= p
        }
        if count > 0 {
            factors = append(factors, count)
        }
        p++
    }
    if n > 1 {
        factors = append(factors, 1)
    }
    return factors
}

func comb(n, r int) int64 {
    if r > n-r {
        r = n - r
    }
    var result int64 = 1
    for i := 1; i <= r; i++ { result = result * int64(n-i+1) % 1000000007 * modPow(int64(i), 1000000005) % 1000000007 }
    return result
}

func modPow(a, e int64) int64 { var r int64 = 1; for e > 0 { if e&1 == 1 { r = r*a%1000000007 }; a = a*a%1000000007; e >>= 1 }; return r }
