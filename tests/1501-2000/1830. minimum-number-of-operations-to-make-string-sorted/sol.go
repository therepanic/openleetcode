func makeStringSorted(s string) int {
    const MOD = 1000000007
    n := len(s)
    fac := make([]int64, n+1)
    invFac := make([]int64, n+1)
    fac[0] = 1
    for i := 1; i <= n; i++ {
        fac[i] = (fac[i-1] * int64(i)) % MOD
    }
    invFac[n] = modPow(fac[n], int64(MOD-2), int64(MOD))
    for i := n; i > 0; i-- {
        invFac[i-1] = (invFac[i] * int64(i)) % MOD
    }
    
    freq := make([]int, 26)
    for _, ch := range s {
        freq[ch-'a']++
    }
    
    var ans int64 = 0
    for i := 0; i < n; i++ {
        smallRight := 0
        for j := 0; j < int(s[i]-'a'); j++ {
            smallRight = (smallRight + freq[j]) % MOD
        }
        
        rem := n - i - 1
        temp := int64(1)
        temp = (temp * fac[rem]) % MOD
        temp = (temp * int64(smallRight)) % MOD
        
        for _, x := range freq {
            if x > 1 {
                temp = (temp * invFac[x]) % MOD
            }
        }
        
        freq[s[i]-'a']--
        ans = (ans + temp) % MOD
    }
    
    return int(ans)
}

func modPow(x int64, n int64, mod int64) int64 {
    if x == 1 || n == 0 {
        return 1
    }
    if n == 1 {
        return x % mod
    }
    if n%2 == 1 {
        return (x * modPow((x*x)%mod, n/2, mod)) % mod
    }
    return modPow((x*x)%mod, n/2, mod) % mod
}
