func baseNeg2(n int) string {
    if n == 0 {
        return "0"
    }
    res := []byte{}
    for n != 0 {
        digit := n & 1
        res = append(res, byte('0'+digit))
        n = (n - digit) / -2
    }
    for i, j := 0, len(res)-1; i < j; i, j = i+1, j-1 {
        res[i], res[j] = res[j], res[i]
    }
    return string(res)
}
