func validTicTacToe(board []string) bool {
    countX, countO := 0, 0
    for _, row := range board {
        for _, c := range row {
            if c == 'X' {
                countX++
            } else if c == 'O' {
                countO++
            }
        }
    }
    
    if countO > countX || countX > countO+1 {
        return false
    }
    
    isWinner := func(player byte) bool {
        for i := 0; i < 3; i++ {
            if board[i][0] == player && board[i][1] == player && board[i][2] == player {
                return true
            }
            if board[0][i] == player && board[1][i] == player && board[2][i] == player {
                return true
            }
        }
        if board[0][0] == player && board[1][1] == player && board[2][2] == player {
            return true
        }
        if board[0][2] == player && board[1][1] == player && board[2][0] == player {
            return true
        }
        return false
    }
    
    xWins := isWinner('X')
    oWins := isWinner('O')
    
    if xWins && oWins {
        return false
    }
    if xWins && countX != countO+1 {
        return false
    }
    if oWins && countX != countO {
        return false
    }
    
    return true
}
