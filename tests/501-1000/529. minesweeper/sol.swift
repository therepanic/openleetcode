class Solution {
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        let directions = [(-1,-1), (-1,0), (-1,1), (0,-1), (0,1), (1,-1), (1,0), (1,1)]
        let rows = board.count
        let cols = board[0].count
        let r = click[0]
        let c = click[1]
        var board = board

        if board[r][c] == "M" {
            board[r][c] = "X"
            return board
        }

        func countMines(_ r: Int, _ c: Int) -> Int {
            var count = 0
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] == "M" {
                    count += 1
                }
            }
            return count
        }

        func reveal(_ r: Int, _ c: Int) {
            if r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != "E" {
                return
            }
            let mines = countMines(r, c)
            if mines > 0 {
                board[r][c] = Character(String(mines))
            } else {
                board[r][c] = "B"
                for (dr, dc) in directions {
                    reveal(r + dr, c + dc)
                }
            }
        }

        reveal(r, c)
        return board
    }
}
