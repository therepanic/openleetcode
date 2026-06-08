class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var board = Array(repeating: Array(repeating: Character("."), count: n), count: n)
        var cols = Array(repeating: false, count: n)
        var diag1 = Array(repeating: false, count: 2 * n)
        var diag2 = Array(repeating: false, count: 2 * n)

        func backtrack(_ row: Int) {
            if row == n {
                res.append(board.map { String($0) })
                return
            }
            for col in 0..<n {
                let d1 = row + col
                let d2 = row - col + n - 1
                if cols[col] || diag1[d1] || diag2[d2] { continue }
                cols[col] = true
                diag1[d1] = true
                diag2[d2] = true
                board[row][col] = Character("Q")
                backtrack(row + 1)
                board[row][col] = Character(".")
                cols[col] = false
                diag1[d1] = false
                diag2[d2] = false
            }
        }

        backtrack(0)
        return res
    }
}
