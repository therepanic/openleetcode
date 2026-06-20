func toHex(num int) string {
    if num == 0 {
        return "0"
    }
    n := uint32(num)
    h := "0123456789abcdef"
    r := []byte{}
    for n > 0 {
        r = append(r, h[n & 15])
        n /= 16
    }
    for i, j := 0, len(r)-1; i < j; i, j = i+1, j-1 {
        r[i], r[j] = r[j], r[i]
    }
    return string(r)
}
