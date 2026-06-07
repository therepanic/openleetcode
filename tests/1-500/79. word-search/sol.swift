class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let chars = Array(word)
        let rows = board.count
        let cols = board[0].count
        func dfs(_ r: Int, _ c: Int, _ idx: Int) -> Bool {
            if idx == chars.count { return true }
            if r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != chars[idx] { return false }
            let saved = board[r][c]
            board[r][c] = "#"
            let found = dfs(r + 1, c, idx + 1) || dfs(r - 1, c, idx + 1) || dfs(r, c + 1, idx + 1) || dfs(r, c - 1, idx + 1)
            board[r][c] = saved
            return found
        }
        for r in 0..<rows {
            for c in 0..<cols {
                if board[r][c] == chars[0] && dfs(r, c, 0) { return true }
            }
        }
        return false
    }
}
