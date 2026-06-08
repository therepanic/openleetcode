func isValidSudoku(board [][]byte) bool {
    var rows [9][9]bool
    var cols [9][9]bool
    var boxes [9][9]bool

    for i := 0; i < 9; i++ {
        for j := 0; j < 9; j++ {
            if board[i][j] == '.' {
                continue
            }
            num := board[i][j] - '1'
            box := (i/3)*3 + (j / 3)
            if rows[i][num] || cols[j][num] || boxes[box][num] {
                return false
            }
            rows[i][num], cols[j][num], boxes[box][num] = true, true, true
        }
    }

    return true
}
