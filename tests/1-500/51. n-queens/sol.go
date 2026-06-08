func solveNQueens(n int) [][]string {
    res := [][]string{}
    board := make([][]byte, n)
    for i := 0; i < n; i++ {
        board[i] = make([]byte, n)
        for j := 0; j < n; j++ {
            board[i][j] = '.'
        }
    }
    cols := make([]bool, n)
    diag1 := make([]bool, 2*n)
    diag2 := make([]bool, 2*n)

    var backtrack func(int)
    backtrack = func(row int) {
        if row == n {
            cur := make([]string, n)
            for i := 0; i < n; i++ {
                cur[i] = string(board[i])
            }
            res = append(res, cur)
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
            board[row][col] = 'Q'
            backtrack(row + 1)
            board[row][col] = '.'
            cols[col] = false
            diag1[d1] = false
            diag2[d2] = false
        }
    }

    backtrack(0)
    return res
}
