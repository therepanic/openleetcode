func gridGame(grid [][]int) int64 {
    minResult := int64(math.MaxInt64)
    row1Sum := int64(0)
    for _, val := range grid[0] {
        row1Sum += int64(val)
    }
    row2Sum := int64(0)
    
    for i := 0; i < len(grid[0]); i++ {
        row1Sum -= int64(grid[0][i])
        currentMax := row1Sum
        if row2Sum > currentMax {
            currentMax = row2Sum
        }
        if currentMax < minResult {
            minResult = currentMax
        }
        row2Sum += int64(grid[1][i])
    }
    
    return minResult
}
