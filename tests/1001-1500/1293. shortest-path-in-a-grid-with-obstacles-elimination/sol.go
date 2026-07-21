func shortestPath(grid [][]int, k int) int {
    n, m := len(grid), len(grid[0])
    type state struct{ r, c, k_rem, d int }
    q := []state{{0, 0, k, 0}}
    visi := make(map[[3]int]bool)
    visi[[3]int{0, 0, k}] = true
    dirs := [][2]int{{-1, 0}, {0, 1}, {1, 0}, {0, -1}}
    for len(q) > 0 {
        cur := q[0]
        q = q[1:]
        r, c, k_rem, d := cur.r, cur.c, cur.k_rem, cur.d
        if r == n-1 && c == m-1 {
            return d
        }
        if grid[r][c] == 1 {
            k_rem--
        }
        for _, dir := range dirs {
            nr, nc := r+dir[0], c+dir[1]
            if nr >= 0 && nr < n && nc >= 0 && nc < m {
                if !visi[[3]int{nr, nc, k_rem}] && k_rem >= 0 {
                    visi[[3]int{nr, nc, k_rem}] = true
                    q = append(q, state{nr, nc, k_rem, d + 1})
                }
            }
        }
    }
    return -1
}
