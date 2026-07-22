class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        var board = Array(repeating: Array(repeating: "", count: 3), count: 3)
        var isA = true
        for move in moves {
            let r = move[0], c = move[1]
            board[r][c] = isA ? "X" : "O"
            isA.toggle()
        }

        for i in 0..<3 {
            if !board[i][0].isEmpty && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
                return board[i][0] == "X" ? "A" : "B"
            }
            if !board[0][i].isEmpty && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
                return board[0][i] == "X" ? "A" : "B"
            }
        }

        if !board[1][1].isEmpty && ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) || (board[0][2] == board[1][1] && board[1][1] == board[2][0])) {
            return board[1][1] == "X" ? "A" : "B"
        }

        return moves.count == 9 ? "Draw" : "Pending"
    }
}
