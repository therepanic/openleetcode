func findIntegers(n int) int {
    f := make([]int, 30)
    f[0] = 1
    f[1] = 2
    for i := 2; i < 30; i++ {
        f[i] = f[i-1] + f[i-2]
    }
    
    ans := 0
    last_seen := 0
    for i := 29; i >= 0; i-- {
        if (1 << i) & n != 0 {
            ans += f[i]
            if last_seen == 1 {
                ans -= 1
                break
            }
            last_seen = 1
        } else {
            last_seen = 0
        }
    }
    return ans + 1
}
