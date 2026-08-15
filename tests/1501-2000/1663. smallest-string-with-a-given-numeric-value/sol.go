func getSmallestString(n int, k int) string {
    res := make([]byte, n)
    for i := range res {
        res[i] = 'a'
    }
    k -= n

    i := n - 1
    for k > 0 {
        add := min(25, k)
        res[i] = byte('a' + add)
        k -= add
        i--
    }

    return string(res)
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
