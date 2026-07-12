func shiftingLetters(s string, shifts []int) string {
    n := len(shifts)
    l := make([]int, n)
    z := 0
    for _, v := range shifts {
        z += v
    }
    l[0] = z
    for i := 1; i < n; i++ {
        l[i] = l[i-1] - shifts[i-1]
    }
    p := make([]int, n)
    for i, c := range s {
        p[i] = int(c - 'a')
    }
    k := make([]byte, n)
    for i := 0; i < n; i++ {
        k[i] = byte((p[i]+l[i])%26 + 97)
    }
    return string(k)
}
