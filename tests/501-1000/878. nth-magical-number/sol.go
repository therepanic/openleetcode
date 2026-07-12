func nthMagicalNumber(n int, a int, b int) int {
    mod := 1000000007
    g := gcd(a, b)
    lcm := a / g * b
    lo := min(a, b)
    hi := n * lo
    for lo < hi {
        mid := (lo + hi) >> 1
        cnt := mid/a + mid/b - mid/lcm
        if cnt < n {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo % mod
}

func gcd(x, y int) int {
    for y != 0 {
        x, y = y, x%y
    }
    return x
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
