func snakesAndLadders(board [][]int) int {
    n := len(board)
    minRolls := make([]int, n*n+1)
    for i := range minRolls {
        minRolls[i] = -1
    }
    q := []int{1}
    minRolls[1] = 0

    for len(q) > 0 {
        x := q[0]
        q = q[1:]
        for i := 1; i <= 6; i++ {
            t := x + i
            if t > n*n {
                break
            }
            row := (t - 1) / n
            col := (t - 1) % n
            r := n - 1 - row
            c := col
            if row%2 == 1 {
                c = n - 1 - col
            }
            v := board[r][c]
            y := t
            if v > 0 {
                y = v
            }
            if y == n*n {
                return minRolls[x] + 1
            }
            if minRolls[y] == -1 {
                minRolls[y] = minRolls[x] + 1
                q = append(q, y)
            }
        }
    }
    return -1
}
