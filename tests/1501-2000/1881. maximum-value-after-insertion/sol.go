func maxValue(n string, x int) string {
    xs := strconv.Itoa(x)
    if n[0] != '-' {
        for i := 0; i < len(n); i++ {
            if xs[0] > n[i] {
                return n[:i] + xs + n[i:]
            }
        }
        return n + xs
    } else {
        for i := 1; i < len(n); i++ {
            if xs[0] < n[i] {
                return n[:i] + xs + n[i:]
            }
        }
        return n + xs
    }
}
