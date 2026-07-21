class Solution {
    func queensAttacktheKing(_ queens: [[Int]], _ king: [Int]) -> [[Int]] {
        var board = Array(repeating: Array(repeating: false, count: 8), count: 8)
        for q in queens {
            board[q[0]][q[1]] = true
        }

        let directions = [
            (-1, 0), (1, 0), (0, 1), (0, -1),
            (-1, -1), (-1, 1), (1, -1), (1, 1)
        ]

        var ans = [[Int]]()
        for (dr, dc) in directions {
            var r = king[0], c = king[1]
            while r >= 0 && r < 8 && c >= 0 && c < 8 {
                r += dr
                c += dc
                guard r >= 0 && r < 8 && c >= 0 && c < 8 else { break }
                if board[r][c] {
                    ans.append([r, c])
                    break
                }
            }
        }
        return ans
    }
}
