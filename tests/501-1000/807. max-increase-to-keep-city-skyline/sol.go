func maxIncreaseKeepingSkyline(grid [][]int) int {
    n := len(grid)
    rowMax := make([]int, n)
    colMax := make([]int, n)
    for r := 0; r < n; r++ {
        maxVal := 0
        for _, val := range grid[r] {
            if val > maxVal {
                maxVal = val
            }
        }
        rowMax[r] = maxVal
    }
    for c := 0; c < n; c++ {
        maxVal := 0
        for r := 0; r < n; r++ {
            if grid[r][c] > maxVal {
                maxVal = grid[r][c]
            }
        }
        colMax[c] = maxVal
    }
    gain := 0
    for r := 0; r < n; r++ {
        for c := 0; c < n; c++ {
            minVal := rowMax[r]
            if colMax[c] < minVal {
                minVal = colMax[c]
            }
            gain += minVal - grid[r][c]
        }
    }
    return gain
}
