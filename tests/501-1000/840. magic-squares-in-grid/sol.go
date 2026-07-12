func numMagicSquaresInside(grid [][]int) int {
    m, n := len(grid), len(grid[0])
    c := 0
    for i := 0; i < m-2; i++ {
        for j := 0; j < n-2; j++ {
            if isMagicSquare(grid, i, j) {
                c++
            }
        }
    }
    return c
}

func isMagicSquare(grid [][]int, r, c int) bool {
    if grid[r+1][c+1] != 5 {
        return false
    }

    a := grid[r][c]; b := grid[r][c+1]; d := grid[r][c+2]
    e := grid[r+1][c]; f := grid[r+1][c+2]
    h := grid[r+2][c]; i := grid[r+2][c+1]; j := grid[r+2][c+2]

    seen := make([]bool, 10)
    arr := []int{a, b, d, e, f, h, i, j, 5}
    for _, x := range arr {
        if x < 1 || x > 9 || seen[x] {
            return false
        }
        seen[x] = true
    }

    if a+j != 10 { return false }
    if b+i != 10 { return false }
    if d+h != 10 { return false }
    if e+f != 10 { return false }

    if a+b+d != 15 { return false }
    if h+i+j != 15 { return false }
    if a+e+h != 15 { return false }
    if d+f+j != 15 { return false }
    if a+5+j != 15 { return false }
    if d+5+h != 15 { return false }

    return true
}
