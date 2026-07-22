func queensAttacktheKing(queens [][]int, king []int) [][]int {
    board := make([][]bool, 8)
    for i := range board {
        board[i] = make([]bool, 8)
    }
    for _, q := range queens {
        board[q[0]][q[1]] = true
    }

    directions := [][]int{
        {-1, 0}, {1, 0}, {0, 1}, {0, -1},
        {-1, -1}, {-1, 1}, {1, -1}, {1, 1},
    }

    ans := [][]int{}
    for _, d := range directions {
        r, c := king[0], king[1]
        for r >= 0 && r < 8 && c >= 0 && c < 8 {
            r += d[0]
            c += d[1]
            if r < 0 || r >= 8 || c < 0 || c >= 8 {
                break
            }
            if board[r][c] {
                ans = append(ans, []int{r, c})
                break
            }
        }
    }
    return ans
}
