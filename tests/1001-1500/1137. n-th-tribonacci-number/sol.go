func tribonacci(n int) int {
    ft, st, tt := 0, 1, 1
    for i := 1; i <= n; i++ {
        frt := ft + st + tt
        ft = st
        st = tt
        tt = frt
    }
    return ft
}
