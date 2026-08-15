func numberOfGoodSubsets(nums []int) int {
    const mod int64 = 1000000007
    primes := [10]int{2,3,5,7,11,13,17,19,23,29}
    freq := [31]int{}
    for _, x := range nums { freq[x]++ }
    masks := [31]int{}
    for x := 2; x <= 30; x++ {
        y, mask := x, 0; ok := true
        for b, p := range primes {
            if y%(p*p) == 0 { ok = false; break }
            if y%p == 0 { mask |= 1 << b }
        }
        if ok { masks[x] = mask }
    }
    dp := [1024]int64{}; dp[0] = 1
    for x := 2; x <= 30; x++ {
        mask := masks[x]
        if mask == 0 || freq[x] == 0 { continue }
        for state := 1023; state >= 0; state-- {
            if state&mask == 0 {
                next := state | mask
                dp[next] = (dp[next] + dp[state] * int64(freq[x])) % mod
            }
        }
    }
    var ans int64
    for state := 1; state < 1024; state++ { ans = (ans + dp[state]) % mod }
    for i := 0; i < freq[1]; i++ { ans = ans * 2 % mod }
    return int(ans)
}
