func nthUglyNumber(n int) int {
    h := make([]int, n)
    h[0] = 1
    i, j, k := 0, 0, 0

    for idx := 1; idx < n; idx++ {
        m := h[i] * 2
        if h[j]*3 < m {
            m = h[j] * 3
        }
        if h[k]*5 < m {
            m = h[k] * 5
        }
        h[idx] = m

        if m == h[i]*2 {
            i++
        }
        if m == h[j]*3 {
            j++
        }
        if m == h[k]*5 {
            k++
        }
    }

    return h[n-1]
}
