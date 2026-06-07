class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Array(repeating: false, count: 9), count: 9)
        var cols = Array(repeating: Array(repeating: false, count: 9), count: 9)
        var boxes = Array(repeating: Array(repeating: false, count: 9), count: 9)

        for i in 0..<9 {
            for j in 0..<9 {
                let cell = board[i][j]
                if cell == "." {
                    continue
                }
                let num = Int(String(cell))! - 1
                let box = (i / 3) * 3 + (j / 3)
                if rows[i][num] || cols[j][num] || boxes[box][num] {
                    return false
                }
                rows[i][num] = true
                cols[j][num] = true
                boxes[box][num] = true
            }
        }

        return true
    }
}
