func numRookCaptures(board [][]byte) int {
    pwa := 0
    for i := 0; i < 8; i++ {
        for j := 0; j < 8; j++ {
            if board[i][j] == 'R' {
                for k := i - 1; k >= 0; k-- {
                    if board[k][j] == 'B' {
                        break
                    } else if board[k][j] == 'p' {
                        pwa++
                        break
                    }
                }
                for k := i + 1; k < 8; k++ {
                    if board[k][j] == 'B' {
                        break
                    } else if board[k][j] == 'p' {
                        pwa++
                        break
                    }
                }
                for k := j + 1; k < 8; k++ {
                    if board[i][k] == 'B' {
                        break
                    } else if board[i][k] == 'p' {
                        pwa++
                        break
                    }
                }
                for k := j - 1; k >= 0; k-- {
                    if board[i][k] == 'B' {
                        break
                    } else if board[i][k] == 'p' {
                        pwa++
                        break
                    }
                }
            }
        }
    }
    return pwa
}
