class Solution {
    func validTicTacToe(_ board: [String]) -> Bool {
        var countX = 0, countO = 0
        for row in board {
            for c in row {
                if c == "X" { countX += 1 }
                if c == "O" { countO += 1 }
            }
        }
        
        if countO > countX || countX > countO + 1 { return false }
        
        func isWinner(_ player: Character) -> Bool {
            let p = String(player)
            let arr = board.map { Array($0) }
            for i in 0..<3 {
                if arr[i][0] == player && arr[i][1] == player && arr[i][2] == player { return true }
                if arr[0][i] == player && arr[1][i] == player && arr[2][i] == player { return true }
            }
            if arr[0][0] == player && arr[1][1] == player && arr[2][2] == player { return true }
            if arr[0][2] == player && arr[1][1] == player && arr[2][0] == player { return true }
            return false
        }
        
        let xWins = isWinner("X")
        let oWins = isWinner("O")
        
        if xWins && oWins { return false }
        if xWins && countX != countO + 1 { return false }
        if oWins && countX != countO { return false }
        
        return true
    }
}
