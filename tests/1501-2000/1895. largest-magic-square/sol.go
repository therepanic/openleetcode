func largestMagicSquare(grid [][]int) int {
    m := len(grid)
    n := len(grid[0])
    res := 1

    isValid := func(i, j, k int) bool {
        s := -1
        for x := i; x < i+k; x++ {
            row := 0
            for y := j; y < j+k; y++ {
                row += grid[x][y]
            }
            if s == -1 {
                s = row
            } else if s != row {
                return false
            }
        }

        for y := j; y < j+k; y++ {
            col := 0
            for x := i; x < i+k; x++ {
                col += grid[x][y]
            }
            if col != s {
                return false
            }
        }

        d1, d2 := 0, 0
        for d := 0; d < k; d++ {
            d1 += grid[i+d][j+d]
            d2 += grid[i+d][j+k-1-d]
        }
        return d1 == s && d2 == s
    }

    for k := 2; k <= min(m, n); k++ {
        for i := 0; i <= m-k; i++ {
            for j := 0; j <= n-k; j++ {
                if isValid(i, j, k) {
                    res = k
                }
            }
        }
    }
    return res
}
