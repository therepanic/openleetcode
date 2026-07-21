func countNegatives(grid [][]int) int {
    count := 0
    for _, row := range grid {
        for _, num := range row {
            if num < 0 {
                count++
            }
        }
    }
    return count
}
