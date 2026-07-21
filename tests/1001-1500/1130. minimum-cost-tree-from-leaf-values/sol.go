func mctFromLeafValues(arr []int) int {
    result := 0
    st := []int{int(^uint(0) >> 1)}

    for _, a := range arr {
        for st[len(st)-1] <= a {
            mid := st[len(st)-1]
            st = st[:len(st)-1]
            result += mid * min(st[len(st)-1], a)
        }
        st = append(st, a)
    }

    first := st[len(st)-1]
    st = st[:len(st)-1]
    for len(st) > 1 {
        result += first * st[len(st)-1]
        first = st[len(st)-1]
        st = st[:len(st)-1]
    }

    return result
}
