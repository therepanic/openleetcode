func maxBuilding(n int, restrictions [][]int) int {
    r := make([][]int, len(restrictions)+1)
    copy(r[:len(restrictions)], restrictions)
    r[len(restrictions)] = []int{1, 0}
    sort.Slice(r, func(i, j int) bool { return r[i][0] < r[j][0] })
    m := len(r)
    
    for i := 1; i < m; i++ {
        if r[i][1] > r[i-1][1] + absInt(r[i][0] - r[i-1][0]) {
            r[i][1] = r[i-1][1] + absInt(r[i][0] - r[i-1][0])
        }
    }
    
    for i := m - 2; i >= 0; i-- {
        if r[i][1] > r[i+1][1] + absInt(r[i+1][0] - r[i][0]) {
            r[i][1] = r[i+1][1] + absInt(r[i+1][0] - r[i][0])
        }
    }
    
    res := 0
    for i := 1; i < m; i++ {
        peak := (r[i-1][1] + r[i][1] + r[i][0] - r[i-1][0]) / 2
        if peak > res {
            res = peak
        }
    }
    
    last := r[m-1][1] + n - r[m-1][0]
    if last > res {
        return last
    }
    return res
}

