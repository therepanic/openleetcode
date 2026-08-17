class Solution {
    func checkMove(_ board: [[Character]], _ rMove: Int, _ cMove: Int, _ color: Character) -> Bool {
        let opposite: Character = color == "B" ? "W" : "B"
        let dirs = [(-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)]

        for (dr, dc) in dirs {
            var r = rMove + dr
            var c = cMove + dc
            var cnt = 0

            while r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == opposite {
                r += dr
                c += dc
                cnt += 1
            }

            if cnt >= 1 && r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == color {
                return true
            }
        }

        return false
    }
}
