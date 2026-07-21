func tictactoe(moves [][]int) string {
    board := make([][]string, 3)
    for i := range board {
        board[i] = make([]string, 3)
        for j := range board[i] {
            board[i][j] = ""
        }
    }

    isA := true
    for _, move := range moves {
        r, c := move[0], move[1]
        if isA {
            board[r][c] = "X"
        } else {
            board[r][c] = "O"
        }
        isA = !isA
    }

    for i := 0; i < 3; i++ {
        if board[i][0] != "" && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
            if board[i][0] == "X" {
                return "A"
            }
            return "B"
        }
        if board[0][i] != "" && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
            if board[0][i] == "X" {
                return "A"
            }
            return "B"
        }
    }

    if board[1][1] != "" && ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) || (board[0][2] == board[1][1] && board[1][1] == board[2][0])) {
        if board[1][1] == "X" {
            return "A"
        }
        return "B"
    }

    if len(moves) == 9 {
        return "Draw"
    }
    return "Pending"
}
