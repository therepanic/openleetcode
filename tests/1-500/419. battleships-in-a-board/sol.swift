class Solution {
    func countBattleships(_ board: [[String]]) -> Int {
        var count = 0
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "X" &&
                   (i == 0 || board[i-1][j] == ".") &&
                   (j == 0 || board[i][j-1] == ".") {
                    count += 1
                }
            }
        }
        return count
    }
}
