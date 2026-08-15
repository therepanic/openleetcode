func minOperations(s string) int {
    c := 0
    j := 0
    n := len(s)
    for _, ch := range s {
        if int(ch-'0') == j {
            c++
        }
        j ^= 1
    }
    if c < n-c {
        return c
    }
    return n - c
}
