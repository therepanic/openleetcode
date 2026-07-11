func regionsBySlashes(grid []string) int {
    n := len(grid)
    parents := make([]int, 4*n*n)
    for i := range parents {
        parents[i] = i
    }
    count := 4 * n * n

    var find func(int) int
    find = func(x int) int {
        if x != parents[x] {
            parents[x] = find(parents[x])
        }
        return parents[x]
    }

    union := func(x, y int) bool {
        rx, ry := find(x), find(y)
        if rx != ry {
            parents[rx] = ry
            return true
        }
        return false
    }

    merges := map[byte][][]int{
        ' ': {{0, 1}, {1, 2}, {2, 3}},
        '/': {{0, 3}, {1, 2}},
        '\\': {{0, 1}, {2, 3}},
    }

    for i := 0; i < n; i++ {
        for j := 0; j < n; j++ {
            base := (i*n + j) * 4
            for _, pair := range merges[grid[i][j]] {
                u, v := pair[0], pair[1]
                if union(base+u, base+v) {
                    count--
                }
            }

            if i+1 < n {
                downBase := ((i+1)*n + j) * 4
                if union(base+2, downBase) {
                    count--
                }
            }

            if j+1 < n {
                rightBase := (i*n + (j + 1)) * 4
                if union(base+1, rightBase+3) {
                    count--
                }
            }
        }
    }
    return count
}
