func countBattleships(board [][]string) int {
    count := 0
    for i := 0; i < len(board); i++ {
        for j := 0; j < len(board[0]); j++ {
            if board[i][j] == "X" &&
                (i == 0 || board[i-1][j] == ".") &&
                (j == 0 || board[i][j-1] == ".") {
                count++
            }
        }
    }
    return count
}
