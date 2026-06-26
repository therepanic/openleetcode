func updateBoard(board [][]byte, click []int) [][]string {
    directions := [][]int{{-1,-1}, {-1,0}, {-1,1}, {0,-1}, {0,1}, {1,-1}, {1,0}, {1,1}}
    rows := len(board)
    cols := len(board[0])
    r, c := click[0], click[1]

    if board[r][c] == 'M' {
        board[r][c] = 'X'
        return toStrings(board)
    }

    var countMines func(int, int) int
    countMines = func(r, c int) int {
        count := 0
        for _, dir := range directions {
            nr, nc := r+dir[0], c+dir[1]
            if nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] == 'M' {
                count++
            }
        }
        return count
    }

    var reveal func(int, int)
    reveal = func(r, c int) {
        if r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != 'E' {
            return
        }
        mines := countMines(r, c)
        if mines > 0 {
            board[r][c] = byte('0' + mines)
        } else {
            board[r][c] = 'B'
            for _, dir := range directions {
                reveal(r+dir[0], c+dir[1])
            }
        }
    }

    reveal(r, c)
    return toStrings(board)
}

func toStrings(board [][]byte) [][]string {
    result := make([][]string, len(board))
    for i := range board {
        result[i] = make([]string, len(board[i]))
        for j := range board[i] {
            result[i][j] = string(board[i][j])
        }
    }
    return result
}
