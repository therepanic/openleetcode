func minFallingPathSum(grid [][]int) int {
    n := len(grid)
    dp := make([]int, n)
    copy(dp, grid[0])
    for i := 1; i < n; i++ {
        smallest := int(^uint(0) >> 1) // max int
        secondSmallest := int(^uint(0) >> 1)
        smallestCol := -1
        for col, value := range dp {
            if value < smallest {
                secondSmallest = smallest
                smallest = value
                smallestCol = col
            } else if value < secondSmallest {
                secondSmallest = value
            }
        }
        newDp := make([]int, n)
        for col, value := range grid[i] {
            if col == smallestCol {
                newDp[col] = value + secondSmallest
            } else {
                newDp[col] = value + smallest
            }
        }
        dp = newDp
    }
    min := dp[0]
    for _, val := range dp {
        if val < min {
            min = val
        }
    }
    return min
}
