func findBall(grid [][]int) []int {
    m := len(grid)
    n := len(grid[0])
    result := make([]int, n)
    for col := 0; col < n; col++ {
        cur := col
        for row := 0; row < m; row++ {
            d := grid[row][cur]
            nxt := cur + d
            if nxt < 0 || nxt >= n || grid[row][nxt] != d {
                cur = -1
                break
            }
            cur = nxt
        }
        result[col] = cur
    }
    return result
}
