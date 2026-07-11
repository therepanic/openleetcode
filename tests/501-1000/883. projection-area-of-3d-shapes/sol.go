func projectionArea(grid [][]int) int {
    xyArea := 0
    yzArea := 0
    zxArea := 0
    rows := len(grid)
    cols := len(grid[0])
    for i := 0; i < rows; i++ {
        maxRow := 0
        for j := 0; j < cols; j++ {
            if grid[i][j] > 0 {
                xyArea++
            }
            if grid[i][j] > maxRow {
                maxRow = grid[i][j]
            }
        }
        yzArea += maxRow
    }
    for j := 0; j < cols; j++ {
        maxCol := 0
        for i := 0; i < rows; i++ {
            if grid[i][j] > maxCol {
                maxCol = grid[i][j]
            }
        }
        zxArea += maxCol
    }
    return xyArea + yzArea + zxArea
}
