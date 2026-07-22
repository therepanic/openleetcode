func minFlips(mat [][]int) int {
    m := len(mat)
    n := len(mat[0])
    masks := make([]int, 0, m*n)
    dirs := [5][2]int{{0, 0}, {1, 0}, {-1, 0}, {0, 1}, {0, -1}}

    for r := 0; r < m; r++ {
        for c := 0; c < n; c++ {
            mask := 0
            for _, d := range dirs {
                nr, nc := r+d[0], c+d[1]
                if 0 <= nr && nr < m && 0 <= nc && nc < n {
                    mask |= 1 << (nr*n + nc)
                }
            }
            masks = append(masks, mask)
        }
    }

    start := 0
    for r := 0; r < m; r++ {
        for c := 0; c < n; c++ {
            if mat[r][c] == 1 {
                start |= 1 << (r*n + c)
            }
        }
    }

    size := 1 << (m * n)
    dist := make([]int, size)
    for i := range dist {
        dist[i] = -1
    }
    q := make([]int, 1, size)
    q[0] = start
    dist[start] = 0

    for head := 0; head < len(q); head++ {
        state := q[head]
        steps := dist[state]
        if state == 0 {
            return steps
        }
        for _, mask := range masks {
            next := state ^ mask
            if dist[next] == -1 {
                dist[next] = steps + 1
                q = append(q, next)
            }
        }
    }

    return -1
}
