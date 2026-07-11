func matrixScore(grid [][]int) int {
    rows := len(grid)
    cols := len(grid[0])
    for _, row := range grid {
        if row[0] == 0 {
            for i := 0; i < cols; i++ {
                row[i] ^= 1
            }
        }
    }
    for j := 1; j < cols; j++ {
        temp := 0
        for i := 0; i < rows; i++ {
            temp += grid[i][j]
        }
        if 2*temp < rows {
            for i := 0; i < rows; i++ {
                grid[i][j] ^= 1
            }
        }
    }
    ans := 0
    for _, row := range grid {
        val := 0
        for _, bit := range row {
            val = (val << 1) | bit
        }
        ans += val
    }
    return ans
}
