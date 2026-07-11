class Solution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var pwa = 0
        for i in 0..<8 {
            for j in 0..<8 {
                if board[i][j] == "R" {
                    for k in stride(from: i - 1, through: 0, by: -1) {
                        if board[k][j] == "B" {
                            break
                        } else if board[k][j] == "p" {
                            pwa += 1
                            break
                        }
                    }
                    for k in i + 1..<8 {
                        if board[k][j] == "B" {
                            break
                        } else if board[k][j] == "p" {
                            pwa += 1
                            break
                        }
                    }
                    for k in j + 1..<8 {
                        if board[i][k] == "B" {
                            break
                        } else if board[i][k] == "p" {
                            pwa += 1
                            break
                        }
                    }
                    for k in stride(from: j - 1, through: 0, by: -1) {
                        if board[i][k] == "B" {
                            break
                        } else if board[i][k] == "p" {
                            pwa += 1
                            break
                        }
                    }
                }
            }
        }
        return pwa
    }
}
