func totalNQueens(n int) int {
    count := 0
    cols := make([]bool, n)
    diag1 := make([]bool, 2*n)
    diag2 := make([]bool, 2*n)

    var backtrack func(int)
    backtrack = func(row int) {
        if row == n {
            count++
            return
        }
        for col := 0; col < n; col++ {
            d1 := row + col
            d2 := row - col + n - 1
            if cols[col] || diag1[d1] || diag2[d2] {
                continue
            }
            cols[col] = true
            diag1[d1] = true
            diag2[d2] = true
            backtrack(row + 1)
            cols[col] = false
            diag1[d1] = false
            diag2[d2] = false
        }
    }

    backtrack(0)
    return count
}
