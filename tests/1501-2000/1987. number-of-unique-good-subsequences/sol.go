func numberOfUniqueGoodSubsequences(binary string) int {
    a, b := 0, 0
    z := 0
    mod := 1000000007
    for _, c := range binary {
        if c == '1' {
            b = (a + b + 1) % mod
        } else {
            a = (a + b) % mod
            z = 1
        }
    }
    return (a + b + z) % mod
}
