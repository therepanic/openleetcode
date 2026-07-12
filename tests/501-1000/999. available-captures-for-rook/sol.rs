impl Solution {
    pub fn num_rook_captures(board: Vec<Vec<char>>) -> i32 {
        let mut pwa = 0;
        for i in 0..8 {
            for j in 0..8 {
                if board[i][j] == 'R' {
                    for k in (0..i).rev() {
                        if board[k][j] == 'B' {
                            break;
                        } else if board[k][j] == 'p' {
                            pwa += 1;
                            break;
                        }
                    }
                    for k in i+1..8 {
                        if board[k][j] == 'B' {
                            break;
                        } else if board[k][j] == 'p' {
                            pwa += 1;
                            break;
                        }
                    }
                    for k in j+1..8 {
                        if board[i][k] == 'B' {
                            break;
                        } else if board[i][k] == 'p' {
                            pwa += 1;
                            break;
                        }
                    }
                    for k in (0..j).rev() {
                        if board[i][k] == 'B' {
                            break;
                        } else if board[i][k] == 'p' {
                            pwa += 1;
                            break;
                        }
                    }
                }
            }
        }
        pwa
    }
}
