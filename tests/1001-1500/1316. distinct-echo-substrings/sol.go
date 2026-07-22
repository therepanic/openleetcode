func distinctEchoSubstrings(text string) int {
    n := len(text)
    b1, b2 := int64(911382323), int64(972663749)
    m1, m2 := int64(1000000007), int64(1000000009)
    p1 := make([]int64, n+1)
    p2 := make([]int64, n+1)
    h1 := make([]int64, n+1)
    h2 := make([]int64, n+1)
    p1[0], p2[0] = 1, 1
    a := int64('a')
    for i := 1; i <= n; i++ {
        v := int64(text[i-1]) - a
        p1[i] = (p1[i-1] * b1) % m1
        p2[i] = (p2[i-1] * b2) % m2
        h1[i] = (h1[i-1]*b1 + v) % m1
        h2[i] = (h2[i-1]*b2 + v) % m2
    }
    get := func(l, r int) [2]int64 {
        v1 := (h1[r] - h1[l]*p1[r-l]) % m1
        v2 := (h2[r] - h2[l]*p2[r-l]) % m2
        if v1 < 0 {
            v1 += m1
        }
        if v2 < 0 {
            v2 += m2
        }
        return [2]int64{v1, v2}
    }
    type entry struct {
        len int
        h1  int64
        h2  int64
    }
    st := make(map[entry]bool)
    for i := 0; i < n; i++ {
        maxLen := (n - i) / 2
        for L := 1; L <= maxLen; L++ {
            if get(i, i+L) == get(i+L, i+2*L) {
                h := get(i, i+2*L)
                st[entry{2 * L, h[0], h[1]}] = true
            }
        }
    }
    return len(st)
}
